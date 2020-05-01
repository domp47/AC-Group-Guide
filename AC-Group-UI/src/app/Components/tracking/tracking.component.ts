import { AuthService } from './../../Services/auth.service';
import { Component, OnInit } from '@angular/core';
import { Art } from '../../Models/art.model'
import { MatButtonToggleChange } from '@angular/material/button-toggle';
import { AngularFirestore } from '@angular/fire/firestore';
import { AuthService } from 'src/app/Services/auth.service';
import { Bug } from 'src/app/Models/bug.model';
import { Fish } from 'src/app/Models/fish.model';
import { Fossil } from 'src/app/Models/fossil.model';

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

  artData = [];
  bugData = [];
  fishData = [];
  fossilData = [];

  constructor(private db: AngularFirestore, private authService: AuthService) { }

  ngOnInit(): void {
    this.nCols = this.calculateCols(window.innerWidth);

    this.getData();
  }

  async getData(){    
    this.db.collection<Art>('art').valueChanges().subscribe((data: Art[]) => {
      this.artData = data;
    });
    this.db.collection<Bug>('bugs').valueChanges().subscribe((data: Bug[]) => {
      this.bugData = data;
    });
    this.db.collection<Fish>('fish').valueChanges().subscribe((data: Fish[]) => {
      this.fishData = data;
    });
    this.db.collection<Fossil>('fossils').valueChanges().subscribe((data: Fossil[]) => {
      this.fossilData = data;
    });
  }

  onResize(event){
    this.nCols = this.calculateCols(event.target.innerWidth);
    console.log(this.nCols);
    
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
