import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/Models/user.model';
import { Fossil } from 'src/app/Models/fossil.model';
import { Art } from 'src/app/Models/art.model';
import { Bug } from 'src/app/Models/bug.model';
import { Fish } from 'src/app/Models/fish.model';
import { AngularFirestore, DocumentSnapshot, DocumentData, QuerySnapshot } from '@angular/fire/firestore';
import { AuthService } from 'src/app/Services/auth.service';
import { mergeMap } from 'rxjs/operators';
import { FaStackItemSizeDirective } from '@fortawesome/angular-fontawesome';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor(private db: AngularFirestore, private authService: AuthService) { }

  data: GroupData[] = [];

  art: Art[] = [];
  bugs: Bug[] = [];
  fish: Fish[] = [];
  fossils: Fossil[] = [];

  ngOnInit(): void {
    this.getMainData();
  }

  getMainData(){
    this.db.collection<Art>('art').valueChanges().pipe(
      mergeMap((art: Art[]) => {this.art = art; return this.db.collection<Bug>('bugs').valueChanges()}),
      mergeMap((bugs: Bug[]) => {this.bugs = bugs; return this.db.collection<Fish>('fish').valueChanges()}),
      mergeMap((fish: Fish[]) => {this.fish = fish; return this.db.collection<Fossil>('fossils').valueChanges()})
    ).subscribe((fossils: Fossil[]) => {
      this.fossils = fossils;
      this.getData();
    });
  }

  getData(){
    this.authService.getUser()
        .pipe(mergeMap(
          (user: firebase.User) => this.db.collection<User>('users').doc(user.uid).get())
        ).subscribe((document: DocumentSnapshot<DocumentData>) => {
    
      var group = document.get('groupRef');
      var uid = document.get('uid');

      if(group == null)
        return

      this.db.collection<User>('users', ref => ref.where('groupRef', '==', group)).get().subscribe((data) => {
        this.data = [];
        for(let user of data.docs){
          if(user.get('uid') == uid)
            continue;

          console.log(user.data());
          

          var entry = new GroupData();
          entry.name = user.get('displayName');

          let caughtItems: string[] = user.get('itemsCaught');
          if(caughtItems == null)
            caughtItems = [];

          for(let a of this.art){
            if(caughtItems.indexOf(a.name) == -1) //Not caught yet
            entry.art.push(a);
          }
          
          for(let b of this.bugs){
            if(caughtItems.indexOf(b.name) == -1) //Not caught yet
            entry.bugs.push(b);
          }

          for(let f of this.fish){
            if(caughtItems.indexOf(f.name) == -1) //Not caught yet
              entry.fish.push(f);
          }

          for(let f of this.fossils){
            if(caughtItems.indexOf(f.name) == -1) //Not caught yet
              entry.fossils.push(f);
          }

          this.data.push(entry);
        }
        console.log(this.data);
      });
    });
  }

}

export class GroupData {
  constructor(){
    this.art = [];
    this.bugs = [];
    this.fish = [];
    this.fossils = [];
  }

  name: string;
  art: Art[];
  bugs: Bug[];
  fish: Fish[];
  fossils: Fossil[];
}