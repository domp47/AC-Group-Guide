import { User } from './user.model'

export class AdminResponse{
    joinCode: String;
    groupName: String;

    users: User[];
    admins: User[];
}