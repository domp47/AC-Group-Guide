import { Component, OnInit, ChangeDetectorRef } from '@angular/core';
import { MatButtonToggleChange } from '@angular/material/button-toggle';
import { map, catchError } from 'rxjs/operators';
import { TrackingResponse } from 'src/app/Models/tracking-response.model';
import { TrackingService } from 'src/app/Services/Tracking/tracking.service';
import { Observable } from 'rxjs';
import { HttpErrorResponse } from '@angular/common/http';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-tracking',
  templateUrl: './tracking.component.html',
  styleUrls: ['./tracking.component.scss'],
})
export class TrackingComponent implements OnInit {
  /**
   * 0 = Art
   * 1 = Bugs
   * 2 = Fish
   * 3 = Fossils
   */
  filter = 0;

  data: TrackingResponse;
  hemisphere: boolean = true;

  constructor(private service: TrackingService, private _snackBar: MatSnackBar, private cdr: ChangeDetectorRef) { }

  ngOnInit(): void {
    this.getData();
  }

  toggleHemisphere() {
    this.hemisphere = !this.hemisphere;
    this.getData();
  }
  
  handleError(err: HttpErrorResponse) {
    let msg = err.error?.message;
    if(msg == null) {
      msg = err.statusText;
    }

    this._snackBar.open(msg, null, {
      duration: 3000
    });
  }

  getData(){
    this.service.getTracking(this.hemisphere).subscribe((data: TrackingResponse) => {
      this.data = data;
    },
    (err: HttpErrorResponse) => {
      this.handleError(err);
    });
  }

  uncatchItem(id: number) {
    this.service.uncatchItem(id).subscribe(_ => {
      this.getData();
    },
    (err: HttpErrorResponse) => {
      this.handleError(err);
    });
  }

  catchItem(id: number){
    this.service.catchItem(id).subscribe(_ => {
      this.getData();
    },
    (err: HttpErrorResponse) => {
      this.handleError(err);
    });
  }

  handleItemClick(event: any) {
    if(event.add) {
      this.catchItem(event.id);
    }else{
      this.uncatchItem(event.id);
    }
  }

  filterChange(event: MatButtonToggleChange) {
    this.filter = event.value;
    // I do not know what's wrong with the change detector, but it takes 4 seconds to see the change without this.
    // TODO: figure out what is happening
    this.cdr.detectChanges();
  }
}
