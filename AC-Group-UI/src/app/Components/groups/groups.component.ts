import { GroupService } from './../../Services/Group/group.service';
import { Component, OnInit } from '@angular/core';
import { Group } from 'src/app/Models/group.model';
import { HttpErrorResponse } from '@angular/common/http';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmationDialogComponent } from '../confirmation-dialog/confirmation-dialog.component';

@Component({
  selector: 'app-groups',
  templateUrl: './groups.component.html',
  styleUrls: ['./groups.component.scss'],
})
export class GroupsComponent implements OnInit {
  constructor(private groupService: GroupService, private _snackBar: MatSnackBar, private router: Router, private dialog: MatDialog) {}

  noGroup: boolean = false;
  group: Group;

  field_newName: String;
  field_joinCode: String;

  ngOnInit(): void {
    this.groupService.get().subscribe((group: Group) => {
      this.noGroup = false;
      this.group = group;
    },
    (err: HttpErrorResponse) => {
      this.noGroup = true;
      this.group = null;
      if (err.status == 419){
        return;
      }

      this._snackBar.open(err.statusText, null, {
        duration: 3000
      });
    });
  }

  createGroup(){
    if (this.field_newName == null || this.field_newName == ""){
      return
    }
    this.groupService.create(this.field_newName).subscribe(() => {
      this.router.navigate(['admin']);
    },
    (err: HttpErrorResponse) => {
      let msg = err.error?.message;
      if(msg == null) {
        msg = err.statusText;
      }

      this._snackBar.open(msg, null, {
        duration: 3000
      });
    });
  }

  joinGroup() {
    if (this.field_joinCode == null || this.field_joinCode == ""){
      return
    }
    this.groupService.join(this.field_joinCode).subscribe(() => {
      this.router.navigate(['home']);
    },
    (err: HttpErrorResponse) => {
      let msg = err.error?.message;
      if(msg == null) {
        msg = err.statusText;
      }

      this._snackBar.open(msg, null, {
        duration: 3000
      });
    });
  }

  leaveGroup() {
    this.groupService.leave().subscribe(() => {
      this.ngOnInit();
    },
    (err: HttpErrorResponse) => {
      let msg = err.error?.message;
      if(msg == null) {
        msg = err.statusText;
      }

      this._snackBar.open(msg, null, {
        duration: 3000
      });
    });
  }

  leaveGroupConfirm() {
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, {
      width: '200px'
    });

    dialogRef.afterClosed().subscribe((result: boolean) => {
      if(result){
        this.leaveGroup();
      }
    });
  }
}
