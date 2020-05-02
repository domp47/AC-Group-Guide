import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-missing-card',
  templateUrl: './missing-card.component.html',
  styleUrls: ['./missing-card.component.scss']
})
export class MissingCardComponent implements OnInit {

  @Input() name: string;
  @Input() imgLocation: string;
  @Input() width: number = null;

  constructor() { }

  ngOnInit(): void {
  }

}
