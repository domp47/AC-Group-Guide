import { GroupService } from './../../Services/Group/group.service';
import { AuthService } from './../../Services/auth.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-groups',
  templateUrl: './groups.component.html',
  styleUrls: ['./groups.component.scss'],
})
export class GroupsComponent implements OnInit {
  constructor(public groupService: GroupService, public authService: AuthService) {}

  ngOnInit(): void {}
}
