
import { Context } from './Context'


class ShikimoriError extends Error {

  isShikimoriError = true

  sdk = 'Shikimori'

  code: string
  ctx: Context

  constructor(code: string, msg: string, ctx: Context) {
    super(msg)
    this.code = code
    this.ctx = ctx
  }

}

export {
  ShikimoriError
}

