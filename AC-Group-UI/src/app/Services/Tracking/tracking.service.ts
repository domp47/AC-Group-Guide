import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { TrackingResponse } from 'src/app/Models/tracking-response.model';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class TrackingService {

  base: string = "/tracking";

  constructor(private http: HttpClient) { }

  getTracking(hemisphere: boolean): Observable<TrackingResponse> {

    const obj = {};
    obj["month"] = 11-new Date().getMonth();
    obj["hour"] = 23-new Date().getHours()-1;
    obj["hemisphere"] = hemisphere;

    return this.http.post<TrackingResponse>(`${this.base}/get`, obj).pipe(
      map(data => data)
    );
  }

  catchItem(id: number): Observable<any> {
    return this.http.put(`${this.base}/${id}`, null).pipe(
      map(data => data)
    );
  }

  uncatchItem(id: number): Observable<any> {
    return this.http.delete(`${this.base}/${id}`, null).pipe(
      map(data => data)
    );
  }
}
