import { AcUser } from '../../models/user.model';
import { Observable, of } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';
import { auth } from 'firebase/app';
import { User } from 'firebase';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  user$: Observable<AcUser>;
  constructor(
    public fireAuth: AngularFireAuth,
    public db: AngularFirestore,
    public router: Router
  ) {
    this.user$ = this.fireAuth.authState.pipe(
      switchMap(user => {
        if (user) {
          return this.db.doc<AcUser>(`users/${user.uid}`).valueChanges()
        } else {
          of(null);
        }
      }
      )
    )
  }

  async googleLogin() {
    const credential = await this.fireAuth.signInWithPopup(new auth.GoogleAuthProvider());
    return this.updateUserData(credential.user);
  }

  updateUserData({ uid, email, displayName, photoURL }: User) {
    const userRef: AngularFirestoreDocument<AcUser> = this.db.doc(`users/${uid}`);

    const data = {
      uid,
      email,
      displayName,
      photoURL
    }

    return userRef.set(data, { merge: true })
  }

  logout() {
    this.fireAuth.signOut();
    this.router.navigate(['/']);
  }
}
