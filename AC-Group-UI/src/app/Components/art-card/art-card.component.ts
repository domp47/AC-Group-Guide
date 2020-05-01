import { Component, OnInit, Input } from '@angular/core';
import { faCircle, faDotCircle } from '@fortawesome/free-regular-svg-icons'
import { faBook, faDollarSign, faUser } from '@fortawesome/free-solid-svg-icons'
import { Art } from 'src/app/Models/art.model';

@Component({
  selector: 'app-art-card',
  templateUrl: './art-card.component.html',
  styleUrls: ['./art-card.component.scss']
})
export class ArtCardComponent implements OnInit {

  faCircle = faCircle;
  faDotCircle = faDotCircle;
  faBook = faBook;
  faDollarSign = faDollarSign;
  faUser = faUser;

  @Input() item: Art;

  constructor() { 
  }
  
  ngOnInit(): void {
  }

}
