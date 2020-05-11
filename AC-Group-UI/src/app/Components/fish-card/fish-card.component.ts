import { Component, OnInit, Input, EventEmitter, Output } from '@angular/core';
import { faCircle, faDotCircle, faCalendar, faClock } from '@fortawesome/free-regular-svg-icons';
import { faDollarSign, faMapMarked, faRulerCombined } from '@fortawesome/free-solid-svg-icons';
import { Fish } from 'src/app/Models/fish.model';

@Component({
  selector: 'app-fish-card',
  templateUrl: './fish-card.component.html',
  styleUrls: ['./fish-card.component.scss'],
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
  @Input() hemisphere: boolean;
  @Input() caught: boolean;

  @Output() clicked: EventEmitter<any> = new EventEmitter();

  constructor() {}

  ngOnInit(): void {}

  itemClicked(){
    let id = this.item.id;
    let add = !this.caught;
    this.clicked.emit({id, add});
  }
}
