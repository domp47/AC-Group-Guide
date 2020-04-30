import { DocumentReference } from '@angular/fire/firestore/interfaces';

export class User {
    uid: string;
    email: string;
    photoURL?: string;
    displayName?: string;
    groupRef: DocumentReference;
}