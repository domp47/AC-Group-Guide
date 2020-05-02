import { Component, OnInit } from '@angular/core';
import { Art } from '../../Models/art.model'
import { MatButtonToggleChange } from '@angular/material/button-toggle';
import { AngularFirestore, AngularFirestoreDocument, DocumentSnapshot, DocumentData } from '@angular/fire/firestore';
import { AuthService } from 'src/app/Services/auth.service';
import { Bug } from 'src/app/Models/bug.model';
import { Fish } from 'src/app/Models/fish.model';
import { Fossil } from 'src/app/Models/fossil.model';
import { User } from 'src/app/Models/user.model';
import { mergeMap } from 'rxjs/operators';

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
  nCols: number;

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

  constructor(private db: AngularFirestore, private authService: AuthService) { }

  ngOnInit(): void {
    this.nCols = this.calculateCols(window.innerWidth);

    this.getData();
  }

  toggleHemisphere(){
    this.hemisphere = !this.hemisphere;
    this.getData();
  }
  
  getData(){
    this.authService.getUser()
        .pipe(mergeMap(
          (user: firebase.User) => this.db.collection<User>('users').doc(user.uid).get())
        ).subscribe((document: DocumentSnapshot<DocumentData>) => {
      
      let itemsCaught: string[] = document.get('itemsCaught');

      if(itemsCaught == null)
          itemsCaught = [];

      let mBit = 1 << (11-new Date().getMonth());
      let hBit = 1 << (23-new Date().getHours()-1);
  
      this.db.collection<Art>('art').valueChanges().subscribe((data: Art[]) => {
        this.artCollected = []
        this.artMissing = [];

        for(let art of data){
          if(itemsCaught.indexOf(art.name) == -1){
            this.artMissing.push(art);
          }else{
            this.artCollected.push(art);
          }
        }
      });
      this.db.collection<Bug>('bugs').valueChanges().subscribe((data: Bug[]) => {
        this.bugsAvail = [];
        this.bugsAvailThisMonth = [];
        this.bugsNotAvail = [];
        this.bugsCaught = [];
  
        for(let bug of data){
          if(itemsCaught.indexOf(bug.name) == -1){
            if((this.hemisphere && (bug.northMonths & mBit) != 0) || (!this.hemisphere && (bug.southMonths & mBit) != 0)){
              if((bug.timeMask & hBit) != 0){
                this.bugsAvail.push(bug);
              }else{
                this.bugsAvailThisMonth.push(bug);
              }
            }else{
              this.bugsNotAvail.push(bug);
            }
          }else{
            this.bugsCaught.push(bug);
          }
        }
      });
      this.db.collection<Fish>('fish').valueChanges().subscribe((data: Fish[]) => {
        this.fishAvail = [];
        this.fishAvailThisMonth = [];
        this.fishNotAvail = [];
        this.fishCaught = [];
  
        for(let fish of data){
          if(itemsCaught.indexOf(fish.name) == -1){
            if((this.hemisphere && (fish.northMonths & mBit) != 0) || (!this.hemisphere && (fish.southMonths & mBit) != 0)){
              if((fish.timeMask & hBit) != 0){
                this.fishAvail.push(fish);
              }else{
                this.fishAvailThisMonth.push(fish);
              }
            }else{
              this.fishNotAvail.push(fish);
            }
          }else{
            this.fishCaught.push(fish);
          }
        }
      });
      this.db.collection<Fossil>('fossils').valueChanges().subscribe((data: Fossil[]) => {
        this.fossilCollected = []
        this.fossilMissing = [];

        for(let fossil of data){
          if(itemsCaught.indexOf(fossil.name) == -1){
            this.fossilMissing.push(fossil);
          }else{
            this.fossilCollected.push(fossil);
          }
        }
      });
    });

  }

  catchItem(event){
    let name = event.name;
    let add = event.add;

    this.authService.getUser()
        .pipe(mergeMap(
          (user: firebase.User) => this.db.collection<User>('users').doc(user.uid).get())
        ).subscribe((document: DocumentSnapshot<DocumentData>) => {
        
      var itemsCaught: string[] = document.get('itemsCaught');

      if(itemsCaught == null)
          itemsCaught = [];
      
      if(add){
        itemsCaught.push(name);
      }else{
        let indx = itemsCaught.indexOf(name);
        if(indx > -1){
          itemsCaught.splice(indx, 1);
        }
      }

      this.db.collection<User>('users').doc(document.get('uid')).set({
        "itemsCaught": itemsCaught
      }, {merge: true});

      this.getData();
    });
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

  filterChange(event: MatButtonToggleChange){
    this.filter = event.value;
  }

}
