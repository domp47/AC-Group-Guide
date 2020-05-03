import { Collectable } from './collectable.model';

export class Animal extends Collectable {
    location: string;
    northMonths: number;
    southMonths: number;
    northMonthLabel: string;
    southMonthLabel: string;
    timeLabel: string;
    timeMask: number;
}
