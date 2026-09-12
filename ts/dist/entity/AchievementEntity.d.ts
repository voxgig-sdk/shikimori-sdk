import { ShikimoriEntityBase } from '../ShikimoriEntityBase';
import type { ShikimoriSDK } from '../ShikimoriSDK';
import type { Control } from '../types';
import type { Achievement, AchievementListMatch } from '../ShikimoriTypes';
declare class AchievementEntity extends ShikimoriEntityBase<Achievement> {
    constructor(client: ShikimoriSDK, entopts: any);
    make(this: AchievementEntity): AchievementEntity;
    list(this: any, reqmatch?: AchievementListMatch, ctrl?: Control): Promise<AchievementEntity[]>;
}
export { AchievementEntity };
