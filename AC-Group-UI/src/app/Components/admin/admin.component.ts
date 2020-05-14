import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/Services/User/user.service';
import { AdminService } from 'src/app/Services/Admin/admin.service';
import { mergeMap, catchError } from 'rxjs/operators';
import { HttpErrorResponse } from '@angular/common/http';
import { User } from 'src/app/Models/user.model';
import { AdminResponse } from 'src/app/Models/admin-response.model';
import { MatSnackBar } from '@angular/material/snack-bar';
import { throwError as observableThrowError, Observable, from } from 'rxjs';
import { faMinus, faTrashAlt, faPlus, faRandom } from '@fortawesome/free-solid-svg-icons';
import { MatDialog } from '@angular/material/dialog';
import { ConfirmationDialogComponent } from '../confirmation-dialog/confirmation-dialog.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.scss'],
})
export class AdminComponent implements OnInit {
  constructor(private userService: UserService, private adminService: AdminService, private _snackBar: MatSnackBar, private dialog: MatDialog, private router: Router) {}

  faMinus = faMinus;
  faTrash = faTrashAlt;
  faPlus = faPlus;
  faTransfer = faRandom;

  roles = ["User", "Administrator", "Owner"];
  displayedColumns: String[] = ["Name", "Role", "Actions"];
  user: User;
  joinCode: String;
  groupName: String;
  users: User[];

  ngOnInit(): void {
    this.userService.getUser().pipe(
      mergeMap((user: User) => {
        this.user = user;

        return this.adminService.getAdminData();
      }),
      catchError((err: HttpErrorResponse) => {
        return observableThrowError(err);
      })
    ).subscribe((data: AdminResponse) => {
      this.joinCode = data.joinCode;
      this.groupName = data.groupName;
      this.users = data.users;
    },
    (err: HttpErrorResponse) => {
      this.handleError(err);
    });
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

  regenerateCode(){
    this.adminService.regenerateCode().subscribe(() => {
      this.ngOnInit();
    },
    (err: HttpErrorResponse) => {
      this.handleError(err);
    });
  }

  deleteGroup(){
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, {
      width: '200px'
    });

    dialogRef.afterClosed().subscribe((result: boolean) => {
      if(result){
        this.adminService.deleteGroup().subscribe(() => {
          this.router.navigate(['groups']);
        },
        (err: HttpErrorResponse) => {
          this.handleError(err);
        })
      }
    });
  }

  removeAdmin(user: User) {
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, {
      width: '200px'
    });

    dialogRef.afterClosed().subscribe((result: boolean) => {
      if(result){
        this.adminService.removeAdmin(user).subscribe(() => {
          this.ngOnInit();
        },
        (err: HttpErrorResponse) => {
          this.handleError(err);
        })
      }
    });
  }

  removeMember(user: User) {
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, {
      width: '200px'
    });

    dialogRef.afterClosed().subscribe((result: boolean) => {
      if(result){
        this.adminService.removeMember(user).subscribe(() => {
          this.ngOnInit();
        },
        (err: HttpErrorResponse) => {
          this.handleError(err);
        })
      }
    });
  }

  transfer(user: User) {
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, {
      width: '200px'
    });

    dialogRef.afterClosed().subscribe((result: boolean) => {
      if(result){
        this.adminService.transfer(user).subscribe(() => {
          this.ngOnInit();
        },
        (err: HttpErrorResponse) => {
          this.handleError(err);
        })
      }
    });
  }

  addAdmin(user: User) {
    const dialogRef = this.dialog.open(ConfirmationDialogComponent, {
      width: '200px'
    });

    dialogRef.afterClosed().subscribe((result: boolean) => {
      if(result){
        this.adminService.addAdmin(user).subscribe(() => {
          this.ngOnInit();
        },
        (err: HttpErrorResponse) => {
          this.handleError(err);
        })
      }
    });
  }
}
