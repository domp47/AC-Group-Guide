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
import { promise } from 'protractor';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  constructor(public fireAuth: AngularFireAuth,public router: Router) {}

  async googleLogin() {
    const credential = await this.fireAuth.signInWithPopup(new auth.GoogleAuthProvider());
    return credential.user;
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
    return this.fireAuth.authState.pipe(
      map(data => data)
    );
  }

  getJWT(): Observable<String> {
    return this.fireAuth.idToken.pipe(
      map(data => data)
    );
  }
}
