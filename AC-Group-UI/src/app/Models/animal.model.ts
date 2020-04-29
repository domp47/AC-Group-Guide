import { Collectable } from './collectable.model';

export class Animal extends Collectable {
    spawnLocation: string;
    activeMonths: number;
    activeHours: number;
}
