import { AuthService } from './../../Services/auth.service';
import { Component, OnInit } from '@angular/core';
import { Art } from '../../Models/art.model'
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

  artData = []

  constructor() { }

  ngOnInit(): void {
    let art: Art = {name: "Academic Painting", imgLocation: "Images/Artwork/Academic Painting.jpg", original: "Vitruvian Man", artist: "Leonardo da Vinci", price: 4980}
    this.artData = [art];
  }

  filterChange(val){
    this.filter = val;
  }

}
