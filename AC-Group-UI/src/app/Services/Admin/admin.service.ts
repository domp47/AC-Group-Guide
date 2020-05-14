import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from 'src/app/Models/user.model';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { AdminResponse } from 'src/app/Models/admin-response.model';

@Injectable({
  providedIn: 'root'
})
export class AdminService {

  base: string = "/admin";

  constructor(private http: HttpClient) {}

  addAdmin(user: User): Observable<any> {
    return this.http.post(`${this.base}`, user).pipe(
      map(data => data)
    );
  }

  removeMember(user: User): Observable<any> {
    const opts = {
      body: user
    }
    return this.http.request('delete', `${this.base}`, opts).pipe(
      map(data => data)
    );
  }

  removeAdmin(user: User): Observable<any> {
    const opts = {
      body: user
    }
    return this.http.request('delete', `${this.base}/admin`, opts).pipe(
      map(data => data)
    );
  }

  regenerateCode(): Observable<any> {
    return this.http.patch(`${this.base}/code`, null).pipe(
      map(data => data)
    );
  }

  deleteGroup(): Observable<any> {
    return this.http.delete(`${this.base}/group`).pipe(
      map(data => data)
    );
  }

  getAdminData(): Observable<AdminResponse> {
    return this.http.get<AdminResponse>(`${this.base}`).pipe(
      map(data => data)
    );
  }

  transfer(user: User): Observable<any> {
    return this.http.post(`${this.base}/transfer`, user).pipe(
      map(data => data)
    );
  }
}
