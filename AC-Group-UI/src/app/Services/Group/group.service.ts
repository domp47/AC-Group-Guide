import { Injectable } from '@angular/core';
import { AngularFireFunctions } from '@angular/fire/functions';

@Injectable({
  providedIn: 'root'
})
export class GroupService {

  constructor(public fns: AngularFireFunctions) {

  }

  async createGroup(groupName = 'ThisIsAGroupName') {
    const _createGroup = this.fns.httpsCallable('createGroup');
    const response = await _createGroup({ groupName }).toPromise();
    console.log(response);
    return response;
  }
}
