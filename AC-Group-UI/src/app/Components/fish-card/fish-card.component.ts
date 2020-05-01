import { Component, OnInit, Input } from '@angular/core';
import { faCircle, faDotCircle, faCalendar, faClock } from '@fortawesome/free-regular-svg-icons';
import { faDollarSign, faMapMarked, faRulerCombined } from '@fortawesome/free-solid-svg-icons';
import { Fish } from 'src/app/Models/fish.model';

@Component({
  selector: 'app-fish-card',
  templateUrl: './fish-card.component.html',
  styleUrls: ['./fish-card.component.scss']
})
export class FishCardComponent implements OnInit {

  faCircle = faCircle;
  faDotCircle = faDotCircle;
  faDollarSign = faDollarSign;
  faCalendar = faCalendar;
  faClock = faClock;
  faMapMarked = faMapMarked;
  faRulerCombined = faRulerCombined;

  @Input() item: Fish;

  constructor() { }

  ngOnInit(): void {
  }

}
