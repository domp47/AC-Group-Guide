import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFirestore } from '@angular/fire/firestore';
import { auth } from 'firebase';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  notUsers$: Observable<any[]>;
  constructor(
    public auth: AngularFireAuth,
    public db: AngularFirestore
  ) {
    this.notUsers$ = db.collection('notusers').valueChanges();
  }

  login() {
    this.auth.signInWithPopup(new auth.GoogleAuthProvider());
    console.log(this.auth);
  }

  logout() {
    this.auth.signOut();
  }

  ngOnInit(): void {
  }

}
