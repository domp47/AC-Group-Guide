import { Component, OnInit } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent {

  constructor(public auth: AngularFireAuth) { }

  logAuth(){
    this.auth.authState.subscribe(data => {
      console.log(data);
      
    });
  }

}
