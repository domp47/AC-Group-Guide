import { Component, OnInit, Input } from '@angular/core';
import { Bug } from 'src/app/Models/bug.model';
import { faCircle, faDotCircle } from '@fortawesome/free-regular-svg-icons'
import { faCalendar, faDollarSign, faClock, faMapMarked  } from '@fortawesome/free-solid-svg-icons'

@Component({
  selector: 'app-bug-card',
  templateUrl: './bug-card.component.html',
  styleUrls: ['./bug-card.component.scss']
})
export class BugCardComponent implements OnInit {

  faCircle = faCircle;
  faDotCircle = faDotCircle;
  faDollarSign = faDollarSign;
  faCalendar = faCalendar;
  faClock = faClock;
  faMapMarked = faMapMarked;

  @Input() item: Bug;

  constructor() { }

  ngOnInit(): void {
  }

}
