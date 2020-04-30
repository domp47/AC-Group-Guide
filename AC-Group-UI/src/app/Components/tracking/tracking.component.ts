import { AuthService } from './../../Services/auth.service';
import { Component, OnInit } from '@angular/core';
import { Art } from '../../Models/art.model'
import { MatButtonToggleChange } from '@angular/material/button-toggle';
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

  artData = []

  constructor() { }

  ngOnInit(): void {
    let academic: Art = {name: "Academic Painting", imgLocation: "Images/Artwork/Academic Painting.jpg", original: "Vitruvian Man", artist: "Leonardo da Vinci", price: 4980, width: 80}
    let amazing: Art = {name: "Amazing Painting", imgLocation: "Images/Artwork/Amazing Painting.jpg", original: "Night Watch", artist: "Rembrandt van Rijn", price: 4980, width: 100}
    let basic: Art = {name: "Basic Painting", imgLocation: "Images/Artwork/Basic Painting.jpg", original: "The Blue Boy", artist: "Thomas Gainsborough", price: 4980, width: 80}
    let calm: Art = {name: "Calm Painting", imgLocation: "Images/Artwork/Calm Painting.jpg", original: "A Sunday Afternoon on the Island of La Grande Jette", artist: "Georges Seurat", price: 4980, width: 100}
    this.artData = [academic, amazing, basic, calm, academic, amazing, basic, calm, academic];
    
    this.nCols = this.calculateCols(window.innerWidth);
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
