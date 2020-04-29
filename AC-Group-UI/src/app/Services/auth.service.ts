import { User } from '../Models/user.model';
import { Observable, of } from 'rxjs';
import { switchMap } from 'rxjs/operators';
import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore, AngularFirestoreDocument } from '@angular/fire/firestore';
import { auth } from 'firebase/app';
import { User as FireUser } from 'firebase';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  user$: Observable<User>;
  constructor(
    public fireAuth: AngularFireAuth,
    public db: AngularFirestore,
    public router: Router
  ) {
    this.user$ = this.fireAuth.authState.pipe(
      switchMap(user => {
        if (user) {
          return this.db.doc<User>(`users/${user.uid}`).valueChanges()
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

  updateUserData({ uid, email, displayName, photoURL }: FireUser) {
    const userRef: AngularFirestoreDocument<User> = this.db.doc(`users/${uid}`);

    const data = {
      uid,
      email,
      displayName,
      photoURL
    }

    return userRef.set(data, { merge: true })
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
