import { Component, OnInit } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/auth';
import { AuthService } from 'src/app/Services/auth.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {

  isAuthenticated: boolean = false;

  constructor(private authService: AuthService) { }
  
  ngOnInit(): void {
    this.authService.getUser().subscribe((data:firebase.User) => {
      console.log(data);
      
      this.isAuthenticated = !(data == null);
    });
  }

  logout(){
    this.authService.logout();
  }
}
