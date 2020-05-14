import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { HomeResponse } from 'src/app/Models/home-response.model';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class HomeService {

  base: string = "/home";

  constructor(private http: HttpClient) { }

  getGroupData(): Observable<HomeResponse[]> {
    return this.http.get<HomeResponse[]>(`${this.base}`).pipe(
      map(data => data)
    );
  }
}
