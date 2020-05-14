import { Component, OnInit } from '@angular/core';
import { HomeResponse } from 'src/app/Models/home-response.model';
import { HomeService } from 'src/app/Services/Home/home.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
})
export class HomeComponent implements OnInit {

  constructor(private service: HomeService, private _snackBar: MatSnackBar) { }

  data: HomeResponse[];
  noGroup: boolean = false;
  nCols: number;

  ngOnInit(): void {
    this.getData();
    this.nCols = this.calculateCols(window.innerWidth);
  }

  onResize(event) {
    this.nCols = this.calculateCols(event.target.innerWidth);
  }

  calculateCols(screenWidth: number): number {
    if (screenWidth < 650) return 2;
    if (screenWidth < 850) return 3;
    if (screenWidth < 1000) return 4;
    if (screenWidth < 1250) return 5;
    if (screenWidth < 1500) return 6;
    if (screenWidth < 1750) return 7;
    return 8;
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
    this.service.getGroupData().subscribe(data => {
      this.noGroup = false;
      this.data = data;
    },
    (err: HttpErrorResponse) => {
      this.noGroup = true;
      this.data = null;
      if (err.status == 419){
        return;
      }

      this.handleError(err);
    });
  }

}
