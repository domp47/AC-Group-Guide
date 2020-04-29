import { AuthService } from './Services/auth.service';
import { Component } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'AC-Group-UI';
  notUsers$: Observable<any[]>;
  constructor(
    public auth: AuthService,
    public db: AngularFirestore
  ) {
    this.notUsers$ = db.collection('notusers').valueChanges();
  }
}
