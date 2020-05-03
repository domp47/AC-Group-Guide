import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/Models/user.model';
import { Fossil } from 'src/app/Models/fossil.model';
import { Art } from 'src/app/Models/art.model';
import { Bug } from 'src/app/Models/bug.model';
import { Fish } from 'src/app/Models/fish.model';
import { AngularFirestore, DocumentSnapshot, DocumentData, QuerySnapshot } from '@angular/fire/firestore';
import { AuthService } from 'src/app/Services/auth.service';
import { mergeMap, first } from 'rxjs/operators';
import { FaStackItemSizeDirective } from '@fortawesome/angular-fontawesome';
import { Group } from 'src/app/Models/group.model';
import { ItemsService } from './../../Services/Items/items.service';
import { Items } from './../../Models/items.model';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor(
    private db: AngularFirestore,
    private authService: AuthService,
    private itemsService: ItemsService
  ) { }

  data: GroupData[] = [];

  inGroup: boolean;

  art: Art[] = [];
  bugs: Bug[] = [];
  fish: Fish[] = [];
  fossils: Fossil[] = [];

  nCols: number;

  ngOnInit(): void {
    this.getMainData();
    this.nCols = this.calculateCols(window.innerWidth);
  }

  onResize(event) {
    this.nCols = this.calculateCols(event.target.innerWidth);
  }

  calculateCols(screenWidth: number): number {
    if (screenWidth < 650)
      return 2;
    if (screenWidth < 850)
      return 3;
    if (screenWidth < 1000)
      return 4;
    if (screenWidth < 1250)
      return 5;
    if (screenWidth < 1500)
      return 6;
    if (screenWidth < 1750)
      return 7;
    return 8;
  }

  getMainData() {
    this.itemsService.items$.pipe(first()).subscribe((items: Items) => {
      console.log(items);
      this.art = items.Art;
      this.fossils = items.Fossils;
      this.fish = items.Fish;
      this.bugs = items.Bugs;
    });
    this.getData();
  }

  getData() {
    this.authService.user$.pipe(first()).subscribe((me: User) => {
      this.authService.members$.subscribe(members => {
        console.log(members);
        this.updateStuff(me.uid, members)
      })
    })
  }

  updateStuff(myUid: string, members: User[]) {
    this.data = [];
    for (let user of members) {
      if (user.uid === myUid)
        continue;

      let entry = new GroupData();
      entry.name = user.displayName;

      let caughtItems: string[] = user.itemsCaught;
      if (caughtItems == null)
        caughtItems = [];

      for (let a of this.art) {
        if (caughtItems.indexOf(a.name) === -1) //Not caught yet
          entry.art.push(a);
      }

      for (let b of this.bugs) {
        if (caughtItems.indexOf(b.name) === -1) //Not caught yet
          entry.bugs.push(b);
      }

      for (let f of this.fish) {
        if (caughtItems.indexOf(f.name) === -1) //Not caught yet
          entry.fish.push(f);
      }

      for (let f of this.fossils) {
        if (caughtItems.indexOf(f.name) === -1) //Not caught yet
          entry.fossils.push(f);
      }

      this.data.push(entry);
    }
  }
}

export class GroupData {
  constructor() {
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