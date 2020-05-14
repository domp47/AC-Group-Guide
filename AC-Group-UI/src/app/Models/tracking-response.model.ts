import { Art } from './art.model';
import { Bug } from './bug.model';
import { Fish } from './fish.model';
import { Fossil } from './fossil.model';

export class TrackingResponse {
    missingArt: Art[];
    acquiredArt: Art[];

    availNowBugs: Bug[];
    availLaterBugs: Bug[];
    notAvailBugs: Bug[];
    caughtBugs: Bug[];

    availNowFish: Fish[];
    availLaterFish: Fish[];
    notAvailFish: Fish[];
    caughtFish: Fish[];

    missingFossils: Fossil[];
    acquiredFossils: Fossil[];
}