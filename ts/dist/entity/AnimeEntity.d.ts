import { ShikimoriEntityBase } from '../ShikimoriEntityBase';
import type { ShikimoriSDK } from '../ShikimoriSDK';
import type { Control } from '../types';
import type { Anime, AnimeListMatch } from '../ShikimoriTypes';
declare class AnimeEntity extends ShikimoriEntityBase<Anime> {
    constructor(client: ShikimoriSDK, entopts: any);
    make(this: AnimeEntity): AnimeEntity;
    list(this: any, reqmatch?: AnimeListMatch, ctrl?: Control): Promise<AnimeEntity[]>;
}
export { AnimeEntity };
