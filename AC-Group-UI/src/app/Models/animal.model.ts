import { Collectable } from './collectable.model';

export class Animal extends Collectable {
    location: string;
    // monthNorthLabel: string; TODO: Need to generate these from seed data
    // monthSouthLabel: string; TODO
    northMonths: number;
    southMonths: number;
    timeLabel: string;
    timeMask: number;
}
