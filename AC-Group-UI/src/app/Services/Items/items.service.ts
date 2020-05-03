import { Injectable } from '@angular/core';
import { AngularFirestore } from '@angular/fire/firestore';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ItemsService {
  items: any;
  items$: Observable<any>;
  constructor(public db: AngularFirestore) {
    this.items = this.db.doc('resources/items').get();
    this.items$ = this.db.doc('resources/items').valueChanges();
  }

}
