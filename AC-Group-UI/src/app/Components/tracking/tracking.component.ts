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
  tabIndex: number;
  data: TrackingResponse;
  hemisphere: boolean = true;

  constructor(private service: TrackingService, private _snackBar: MatSnackBar, private cdr: ChangeDetectorRef) { }

  ngOnInit(): void {
    this.getData();
    
    var indx = localStorage.getItem("tabIndex");
    if( indx == null)
      indx = "0";

    var hemisphere = localStorage.getItem("isNorthHemi");
    if( hemisphere == null )
      hemisphere = "true";

    this.tabIndex = +indx;
    this.hemisphere = JSON.parse(hemisphere);
  }

  setTabIndex(newIndex) {
    console.log("yeet");
    console.log(newIndex);
    
    
    this.tabIndex = newIndex;
    localStorage.setItem("tabIndex", newIndex.toString());
  }

  toggleHemisphere() {
    this.hemisphere = !this.hemisphere;
    localStorage.setItem("isNorthHemi", String(this.hemisphere));
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
}
