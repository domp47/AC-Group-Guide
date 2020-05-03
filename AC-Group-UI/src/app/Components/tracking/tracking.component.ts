import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { MatButtonToggleChange } from '@angular/material/button-toggle';
import { AngularFirestore } from '@angular/fire/firestore';
import { AuthService } from 'src/app/Services/auth.service';

import { User } from 'src/app/Models/user.model';
import { first } from 'rxjs/operators';
import { ItemsService } from './../../Services/Items/items.service';
import { Items } from './../../Models/items.model';

@Component({
  selector: 'app-tracking',
  templateUrl: './tracking.component.html',
  styleUrls: ['./tracking.component.scss']
})
export class TrackingComponent implements OnInit {

  /**
   * 0 = Art
   * 1 = Bugs
   * 2 = Fish
   * 3 = Fossils
   */
  filter = 0;

  artCollected = [];
  artMissing = []

  fossilCollected = [];
  fossilMissing = [];

  bugsAvail = [];
  bugsAvailThisMonth = [];
  bugsNotAvail = [];
  bugsCaught = [];

  fishAvail = [];
  fishAvailThisMonth = [];
  fishNotAvail = [];
  fishCaught = [];

  hemisphere: boolean = true;

  constructor(
    private db: AngularFirestore,
    private authService: AuthService,
    public itemsService: ItemsService,
    private cdr: ChangeDetectorRef
  ) { }

  ngOnInit(): void {
    this.getData();
  }

  toggleHemisphere() {
    this.hemisphere = !this.hemisphere;
    this.getData();
  }

  getData() {
    console.log('Gets here...');
    this.authService.user$.pipe().subscribe(
      user => {
        this.itemsService.items$.pipe().subscribe(
          items => {
            this.updateData(user, items);
          }
        )
      })
  }

  updateData(user: User, items: Items) {
    const start = performance.now();
    const { Art: artData, Bugs: bugsData, Fish: fishData, Fossils: fossilsData } = items;
    console.log(items);
    const itemsCaught: string[] = user.itemsCaught ? user.itemsCaught : [];

    // I hate this but ok.
    let mBit = 1 << (11 - new Date().getMonth());
    let hBit = 1 << (23 - new Date().getHours() - 1);

    this.artCollected = []
    this.artMissing = [];

    for (let art of artData) {
      if (itemsCaught.indexOf(art.name) == -1) {
        this.artMissing.push(art);
      } else {
        this.artCollected.push(art);
      }
    }

    this.bugsAvail = [];
    this.bugsAvailThisMonth = [];
    this.bugsNotAvail = [];
    this.bugsCaught = [];

    for (let bug of bugsData) {
      if (itemsCaught.indexOf(bug.name) == -1) {
        if ((this.hemisphere && (bug.northMonths & mBit) != 0) || (!this.hemisphere && (bug.southMonths & mBit) != 0)) {
          if ((bug.timeMask & hBit) != 0) {
            this.bugsAvail.push(bug);
          } else {
            this.bugsAvailThisMonth.push(bug);
          }
        } else {
          this.bugsNotAvail.push(bug);
        }
      } else {
        this.bugsCaught.push(bug);
      }
    }

    this.fishAvail = [];
    this.fishAvailThisMonth = [];
    this.fishNotAvail = [];
    this.fishCaught = [];

    for (let fish of fishData) {
      if (itemsCaught.indexOf(fish.name) == -1) {
        if ((this.hemisphere && (fish.northMonths & mBit) != 0) || (!this.hemisphere && (fish.southMonths & mBit) != 0)) {
          if ((fish.timeMask & hBit) != 0) {
            this.fishAvail.push(fish);
          } else {
            this.fishAvailThisMonth.push(fish);
          }
        } else {
          this.fishNotAvail.push(fish);
        }
      } else {
        this.fishCaught.push(fish);
      }
    }

    this.fossilCollected = []
    this.fossilMissing = [];

    for (let fossil of fossilsData) {
      if (itemsCaught.indexOf(fossil.name) == -1) {
        this.fossilMissing.push(fossil);
      } else {
        this.fossilCollected.push(fossil);
      }
    }
  }

  catchItem(event) {
    let name = event.name;
    let add = event.add;

    this.authService.user$.pipe(first()).subscribe((user: User) => {
      const itemsCaught = user.itemsCaught ? user.itemsCaught : [];

      if (add) {
        itemsCaught.push(name);
      } else {
        let indx = itemsCaught.indexOf(name);
        if (indx > -1) {
          itemsCaught.splice(indx, 1);
        }
      }

      this.db.collection<User>('users').doc(user.uid).set({
        itemsCaught
      }, { merge: true });

    });
  }

  filterChange(event: MatButtonToggleChange) {
    this.filter = event.value;
    // I do not know what's wrong with the change detector, but it takes 4 seconds to see the change without this.
    // TODO: figure out what is happening
    this.cdr.detectChanges();
  }

}
