import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Group } from 'src/app/Models/group.model';

@Injectable({
  providedIn: 'root',
})
export class GroupService {

  base: string = "/groups";

  constructor(private http: HttpClient) {}

  join(code: String): Observable<any> {
    const obj = {};
    obj["code"] = code;

    return this.http.post(`${this.base}/join`, obj).pipe(
      map(data => data)
    );
  }

  create(name: String): Observable<Group> {
    const obj = {};
    obj["name"] = name;

    return this.http.post<Group>(`${this.base}/create`, obj).pipe(
      map(data => data)
    );
  }

  leave(): Observable<any> {
    return this.http.delete(`${this.base}`).pipe(
      map(data => data)
    );
  }

  get(): Observable<Group> {
    return this.http.get<Group>(`${this.base}`).pipe(
      map(data => data)
    );
  }
}
