import { Injectable } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { auth } from 'firebase';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private auth: AngularFireAuth, private router: Router) { }

  login(){
    this.auth.signInWithPopup(new auth.GoogleAuthProvider()).then((data: auth.UserCredential) => {
      this.router.navigate(['home']);  
    });
  }

  logout(){
    this.auth.signOut().then(() => {
      this.router.navigate(['login']);
    });
  }

  getUser(): Observable<firebase.User>{
    return this.auth.authState;
  }
}
