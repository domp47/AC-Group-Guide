import { AngularFirestore } from '@angular/fire/firestore';
import { Injectable } from '@angular/core';
import { AngularFireFunctions } from '@angular/fire/functions';

@Injectable({
  providedIn: 'root'
})
export class GroupService {

  constructor(public fns: AngularFireFunctions, public db: AngularFirestore) {

  }

  async createGroup(groupName = 'ThisIsAGroupName') {
    const _createGroup = this.fns.httpsCallable('createGroup');
    const response = await _createGroup({ groupName }).toPromise();
    console.log(response);
    return response;
  }

  async joinGroup(joinCode: string) {
    console.log(joinCode);
    const _joinGroup = this.fns.httpsCallable('joinGroup');
    const response = await _joinGroup({ joinCode }).toPromise();
    console.log(response);
    return response;
  }
}
