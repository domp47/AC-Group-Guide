import * as functions from 'firebase-functions'
import * as admin from 'firebase-admin'
import { DocumentReference } from '@google-cloud/firestore'

enum Errors {
    AlreadyInAGroup = 'alreadyInAGroup',
    InvalidJoinCode = 'invalidJoinCode'
}

interface User {
    groupRef: DocumentReference
}

admin.initializeApp()

const db = admin.firestore()

export const randomReadableId = (length = 4) => {
    let result = ''
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    const charactersLength = characters.length
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength))
    }
    return result
}

async function getNewJoinCode(): Promise<string> {
    const newJoinCode = randomReadableId()
    const jd = (await db.doc('helperData/joinCodesDict').get()).data()
    if (jd) {
        if (jd[newJoinCode]) {
            // Collision...
            return await getNewJoinCode()
        } else {
            return newJoinCode
        }
    } else {
        await db.doc('helperData/joinCodesDict').set({ [newJoinCode]: true })
        return newJoinCode
    }
}

async function _createGroup(creatorUid: string, groupName: string) {
    const creatorUserDoc = db.doc(`users/${creatorUid}`)
    const joinCode = await getNewJoinCode()
    const groupRef = await db.collection('groups').add({
        joinCode,
        name: groupName
    })
    await creatorUserDoc.set({ groupRef }, { merge: true })
    await db.doc('helperData/joinCodesDict').set({ [joinCode]: groupRef })
    // Create references to creator's doc in members and admins subcollections.
    await groupRef.collection('members').doc(creatorUid).set({ userRef: creatorUserDoc })
    await groupRef.collection('admins').doc(creatorUid).set({ userRef: creatorUserDoc })
}

async function _joinGroup(uid: string, joinCode: string): Promise<any> {
    const joinCodesDict = (await db.doc('helperData/joinCodesDict').get()).data()
    const userDoc = db.doc(`users/${uid}`)

    console.log(joinCodesDict)
    console.log(joinCode)
    if (joinCodesDict) {
        const groupRef: DocumentReference = joinCodesDict[joinCode]
        console.log(groupRef)
        if (groupRef) {
            await groupRef.collection('members').doc(uid).set({ userRef: userDoc })
            await userDoc.set({ groupRef }, { merge: true })
            return { success: true }
        } else {
            return { success: false, errorSlug: Errors.InvalidJoinCode }
        }
    }
    return { success: false }
}


exports.createGroup = functions.https.onCall(async ({ groupName }, context) => {
    if (context && context.auth) {
        const uid = context.auth.uid
        const user = (await db.doc(`users/${uid}`).get()).data() as User

        if (user.groupRef) {
            // already in a group
            return { success: false, errorSlug: Errors.AlreadyInAGroup }
        }

        await _createGroup(uid, groupName)
        return { success: true }
    }
    else {
        return { success: false, error: 'Not logged in!' }
    }
})

exports.joinGroup = functions.https.onCall(async ({ joinCode }, context) => {
    if (context && context.auth) {
        const uid = context.auth.uid
        const user = (await db.doc(`users/${uid}`).get()).data() as User

        if (user.groupRef) {
            // already in a group
            return { success: false, errorSlug: Errors.AlreadyInAGroup }
        }

        return await _joinGroup(uid, joinCode)
    }
    else {
        return { success: false, error: 'Not logged in!' }
    }
})

