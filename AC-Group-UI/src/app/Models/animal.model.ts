import { Collectable } from './collectable.model';

export class Animal extends Collectable {
    location: string;
    northMonths: number;
    southMonths: number;
    timeLabel: string;
    timeMask: number;
}
