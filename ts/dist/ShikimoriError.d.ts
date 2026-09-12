import { Context } from './Context';
declare class ShikimoriError extends Error {
    isShikimoriError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { ShikimoriError };
