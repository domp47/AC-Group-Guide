import { Collectable } from './collectable.model';

export class Art extends Collectable {
  original: string;
  artist: string;
  width: number;
  isPainting: boolean;
}
