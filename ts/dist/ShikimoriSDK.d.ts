import { AchievementEntity } from './entity/AchievementEntity';
import { AnimeEntity } from './entity/AnimeEntity';
export type * from './ShikimoriTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { ShikimoriEntityBase } from './ShikimoriEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
declare class ShikimoriSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    _rawRequest(fetchargs?: any): Promise<Error | {
        ok: boolean;
        status: number;
        headers: any;
        data: any;
        err?: undefined;
    } | {
        ok: boolean;
        err: any;
        status?: undefined;
        headers?: undefined;
        data?: undefined;
    }>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    Achievement(entopts?: Record<string, any>): AchievementEntity;
    Anime(entopts?: Record<string, any>): AnimeEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): ShikimoriSDK;
    tester(testopts?: any, sdkopts?: any): ShikimoriSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof ShikimoriSDK;
export { stdutil, config, BaseFeature, ShikimoriEntityBase, ShikimoriSDK, SDK, };
