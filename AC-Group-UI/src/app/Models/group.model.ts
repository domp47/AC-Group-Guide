import { User } from './user.model';

export class Group {
    name: string;
    joinCode: string;
    users: User[];
}
