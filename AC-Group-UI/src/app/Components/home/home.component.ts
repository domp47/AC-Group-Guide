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
import { Group } from 'src/app/Models/group.model';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor(private db: AngularFirestore, private authService: AuthService) { }

  data: GroupData[] = [];

  inGroup: boolean;

  art: Art[] = [];
  bugs: Bug[] = [];
  fish: Fish[] = [];
  fossils: Fossil[] = [];

  nCols: number;

  ngOnInit(): void {
    this.getMainData();

    this.authService.getUser().subscribe((fbUser) => {
      this.db.collection<User>('users').doc<User>(fbUser.uid).valueChanges().subscribe((user) => {
        this.inGroup = !(user.groupRef == null);
      });
    });

    this.nCols = this.calculateCols(window.innerWidth);
  }

  onResize(event){
    this.nCols = this.calculateCols(event.target.innerWidth);
  }

  calculateCols(screenWidth: number): number{
    if(screenWidth < 650)
      return 2;
    if(screenWidth < 850)
      return 3;
    if(screenWidth < 1000)
      return 4;
    if(screenWidth < 1250)
      return 5;
    if(screenWidth < 1500)
      return 6;
    if(screenWidth < 1750)
      return 7;
    return 8;
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