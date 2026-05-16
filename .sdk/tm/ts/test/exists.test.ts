
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { ShikimoriSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await ShikimoriSDK.test()
    equal(null !== testsdk, true)
  })

})
