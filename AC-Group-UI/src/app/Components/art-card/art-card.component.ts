import { Component, OnInit, Input } from '@angular/core';
import { faCircle } from '@fortawesome/free-regular-svg-icons'
import { Art } from 'src/app/Models/art.model';

@Component({
  selector: 'app-art-card',
  templateUrl: './art-card.component.html',
  styleUrls: ['./art-card.component.scss']
})
export class ArtCardComponent implements OnInit {

  faCircle = faCircle;

  @Input() item: Art;

  constructor() { }

  ngOnInit(): void {
    this.item.imgLocation = "./assets/" + this.item.imgLocation;
  }

}
