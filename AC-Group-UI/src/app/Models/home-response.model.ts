import { Art } from './art.model';
import { Fossil } from './fossil.model';
import { Bug } from './bug.model';
import { Fish } from './fish.model';

export class HomeResponse {
    displayName: String;

    missingArt: Art[];
    missingBugs: Bug[];
    missingFish: Fish[];
    missingFossils: Fossil[];
}