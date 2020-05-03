import { Art } from 'src/app/Models/art.model';
import { Bug } from 'src/app/Models/bug.model';
import { Fish } from 'src/app/Models/fish.model';
import { Fossil } from 'src/app/Models/fossil.model';
export interface Items {
  Art: Art[];
  Bugs: Bug[];
  Fish: Fish[];
  Fossils: Fossil[];
}
