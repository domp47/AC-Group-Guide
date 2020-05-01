import { Component, OnInit, Input } from '@angular/core';
import { faCircle, faDotCircle } from '@fortawesome/free-regular-svg-icons';
import { faDollarSign } from '@fortawesome/free-solid-svg-icons';
import { Fossil } from 'src/app/Models/fossil.model';

@Component({
  selector: 'app-fossil-card',
  templateUrl: './fossil-card.component.html',
  styleUrls: ['./fossil-card.component.scss']
})
export class FossilCardComponent implements OnInit {

  faCircle = faCircle;
  faDotCircle = faDotCircle;
  faDollarSign = faDollarSign;

  @Input() item: Fossil;

  constructor() { }

  ngOnInit(): void {
  }

}
