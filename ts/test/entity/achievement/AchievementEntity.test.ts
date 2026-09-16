

import Path from 'node:path'
import * as Fs from 'node:fs'

import { test, describe, afterEach } from 'node:test'
import assert from 'node:assert'
import { createLiveTransport } from '../../live-runner'
import { runLiveEntity } from '../../live-entity'


import { ShikimoriSDK, BaseFeature, stdutil } from '../../..'

import {
  envOverride,
  liveClientOptions,
  liveDelay,
  loadEnvLocal,
  makeCtrl,
  makeMatch,
  makeReqdata,
  makeStepData,
  makeValid,
  maybeSkipControl,
} from '../../utility'


// AFTER the imports on purpose: TypeScript hoists `import` above any
// statement in the emitted CommonJS, so a loader placed above them would
// run only after every imported module had already been evaluated - and
// anything reading process.env at module scope would miss these values.
loadEnvLocal(__dirname + '/../../../.env.local')


describe('AchievementEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when SHIKIMORI_TEST_LIVE=TRUE.
  afterEach(liveDelay('SHIKIMORI_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = ShikimoriSDK.test()
    const ent = testsdk.Achievement()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.SHIKIMORI_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'achievement.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"name":"id","req":false,"short":"Achievement ID","type":"`$INTEGER`","index$":0},{"active":true,"name":"level","req":false,"short":"Achievement level","type":"`$INTEGER`","index$":1},{"active":true,"name":"neko_id","req":false,"short":"Neko achievement identifier","type":"`$STRING`","index$":2},{"active":true,"name":"progress","req":false,"short":"Progress towards next level","type":"`$INTEGER`","index$":3},{"active":true,"name":"user_id","req":false,"short":"User ID","type":"`$INTEGER`","index$":4}],"id":{"field":"id","name":"id"},"name":"achievement","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"user_id","orig":"user_id","reqd":true,"type":"`$INTEGER`","index$":0}]},"contract":{"id":"GET /achievements","json":"{\"operationId\":\"getAchievements\",\"parameters\":[{\"description\":\"The ID of the user whose achievements to retrieve\",\"in\":\"query\",\"name\":\"user_id\",\"required\":true,\"schema\":{\"type\":\"integer\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"items\":{\"description\":\"User achievement object\",\"properties\":{\"id\":{\"description\":\"Achievement ID\",\"type\":\"integer\"},\"level\":{\"description\":\"Achievement level\",\"type\":\"integer\"},\"neko_id\":{\"description\":\"Neko achievement identifier\",\"type\":\"string\"},\"progress\":{\"description\":\"Progress towards next level\",\"type\":\"integer\"},\"user_id\":{\"description\":\"User ID\",\"type\":\"integer\"}},\"type\":\"object\"},\"type\":\"array\"}}},\"description\":\"Successful response\"},\"400\":{\"description\":\"Bad request - Invalid user_id\"},\"401\":{\"description\":\"Unauthorized - Invalid or missing OAuth2 token\"},\"429\":{\"description\":\"Rate limit exceeded (5rps or 90rpm)\"}},\"security\":[{\"oauth2\":[]}],\"securitySchemes\":{\"oauth2\":{\"description\":\"OAuth2 authentication. See https://shikimori.one/oauth for details. User-Agent header with your OAuth2 Application name is required.\",\"flows\":{\"authorizationCode\":{\"authorizationUrl\":\"https://shikimori.one/oauth/authorize\",\"scopes\":{},\"tokenUrl\":\"https://shikimori.one/oauth/token\"}},\"type\":\"oauth2\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/achievements","segments":[{"lit":"achievements"}],"select":{"exist":["user_id"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"achievement","name__orig":"achievement","Name":"Achievement","name_":"achievement","name-":"achievement","NAME":"ACHIEVEMENT","index$":0}, {"active":true,"entity":"achievement","key$":"BasicAchievementFlow","kind":"basic","name":"BasicAchievementFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"achievement_ref01"}}],"index$":0}]}, 'Achievement')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let achievement_ref01_data = Object.values(setup.data.existing.achievement)[0] as any

    // LIST
    const achievement_ref01_ent = client.Achievement()
    const achievement_ref01_match: any = {}

    const achievement_ref01_list = (await achievement_ref01_ent.list(achievement_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/achievement/AchievementTestData.json')

  // TODO: file ready util needed?
  const entityDataSource = Fs.readFileSync(entityDataFile).toString('utf8')

  // TODO: need a xlang JSON parse utility in voxgig/struct with better error msgs
  const entityData = JSON.parse(entityDataSource)

  options.entity = entityData.existing

  let client = ShikimoriSDK.test(options, extra)
  const struct = client.utility().struct
  const merge = struct.merge
  const transform = struct.transform

  let idmap = transform(
    ['achievement01','achievement02','achievement03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'SHIKIMORI_TEST_ACHIEVEMENT_ENTID': idmap,
    'SHIKIMORI_TEST_LIVE': 'FALSE',
    'SHIKIMORI_TEST_EXPLAIN': 'FALSE',
    'SHIKIMORI_APIKEY': '',
  })

  idmap = env['SHIKIMORI_TEST_ACHIEVEMENT_ENTID']

  const live = 'TRUE' === env.SHIKIMORI_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['SHIKIMORI_TEST_ACHIEVEMENT_ENTID']
    idmap = rawIds && rawIds.trim() ? JSON.parse(rawIds) : {}
    if (!idmap || Array.isArray(idmap) || typeof idmap !== 'object') {
      throw new Error('Live ENTID must be a JSON object')
    }
    client = new ShikimoriSDK(merge([
      // FIRST, so the generated fields below win: sdk-test-control.json's
      // test.client.options adds to the live client, it does not redirect it.
      liveClientOptions(),
      {
        apikey: env.SHIKIMORI_APIKEY,
      },
      // 'extra || {}', not a bare 'extra': struct.merge returns UNDEFINED when the
      // last entry is undefined, and basicSetup is normally called with no
      // argument at all - so a bare 'extra' silently discarded the apikey
      // and server values above and handed the SDK undefined. Harmless
      // while there was nothing in that object; not harmless now.
      extra || {},
      { system: { fetch: transport.fetch } }
    ]))
  }

  const setup = {
    idmap,
    env,
    options,
    client,
    struct,
    data: entityData,
    explain: 'TRUE' === env.SHIKIMORI_TEST_EXPLAIN,
    live,
    transport,
    now: Date.now(),
  }

  return setup
}
  
