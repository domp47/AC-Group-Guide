import { DocumentReference } from '@angular/fire/firestore/interfaces';
import { Group } from './../Models/group.model';
import { User } from '../Models/user.model';
import { Observable, of, zip } from 'rxjs';
import { switchMap, map } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';
import { auth } from 'firebase/app';
import { User as FireUser } from 'firebase';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  user$: Observable<User>; // If you need access to user data on firestore, only use this.
  group$: Observable<Group>; // If you need access to group data/members, only use these
  members$: Observable<User[]>;

  constructor(public fireAuth: AngularFireAuth, public db: AngularFirestore, public router: Router) {
    this.user$ = this.fireAuth.authState
      .pipe(
        switchMap((user) => {
          if (user) {
            return this.db.doc<User>(`users/${user.uid}`).valueChanges();
          } else {
            return of(null);
          }
        })
      )
      .pipe(
        map((value) => {
          return value;
        })
      );

    this.group$ = this.user$.pipe(
      switchMap((user) => {
        if (user && user.groupRef) {
          return this.db.doc<Group>(user.groupRef.path).valueChanges();
        } else {
          return of(null);
        }
      })
    );

    this.members$ = this.user$
      .pipe(
        switchMap((user) => {
          if (user && user.groupRef) {
            return this.db.doc<Group>(user.groupRef.path).collection('members').valueChanges();
          } else {
            return of(null);
          }
        })
      )
      .pipe(
        switchMap((members: any[]) => {
          if (members) {
            const memberObservables: Observable<User>[] = members.map(({ userRef }: { userRef: DocumentReference }) => {
              const userObservable = this.db.doc<User>(userRef.path).valueChanges();
              return userObservable;
            });
            return zip(...memberObservables);
          } else {
            return of(null);
          }
        })
      );
  }

  async googleLogin() {
    const credential = await this.fireAuth.signInWithPopup(new auth.GoogleAuthProvider());
    return this.updateUserData(credential.user);
  }

  updateUserData({ uid, email, displayName, photoURL }: FireUser) {
    const userRef: AngularFirestoreDocument<User> = this.db.doc(`users/${uid}`);

    const data = {
      uid,
      email,
      displayName,
      photoURL,
    } as User;

    return userRef.set(data, { merge: true });
  }

  async login() {
    await this.googleLogin();
    this.router.navigate(['home']);
  }

  async logout() {
    await this.fireAuth.signOut();
    this.router.navigate(['login']);
  }

  getUser(): Observable<FireUser> {
    return this.fireAuth.authState;
  }
}
