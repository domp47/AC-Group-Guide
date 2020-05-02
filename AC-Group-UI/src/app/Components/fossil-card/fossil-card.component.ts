import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
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
  @Input() caught: boolean;

  @Output() clicked: EventEmitter<any> = new EventEmitter();
  constructor() { }

  ngOnInit(): void {
  }

  itemClicked(){
    let name = this.item.name;
    let add = !this.caught;
    this.clicked.emit({name, add});
  }

}
