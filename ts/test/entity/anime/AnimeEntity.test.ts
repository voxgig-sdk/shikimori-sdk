

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


describe('AnimeEntity', async () => {

  // Per-test live pacing. Delay is read from sdk-test-control.json's
  // `test.live.delayMs`; only sleeps when SHIKIMORI_TEST_LIVE=TRUE.
  afterEach(liveDelay('SHIKIMORI_TEST_LIVE'))

  test('instance', async () => {
    const testsdk = ShikimoriSDK.test()
    const ent = testsdk.Anime()
    assert(null != ent)
  })


  test('basic', async (t) => {

    const live = 'TRUE' === process.env.SHIKIMORI_TEST_LIVE
    for (const op of ['list']) {
      if (!live && maybeSkipControl(t, 'entityOp', 'anime.' + op, live)) return
    }

    
    const setup = basicSetup()
    if (setup.live) {
      return runLiveEntity(setup, {"active":true,"alias":{"field":{}},"fields":[{"active":true,"format":"date","name":"aired_on","req":false,"short":"Aired date","type":"`$STRING`","index$":0},{"active":true,"name":"anons","req":false,"short":"Is in anons state","type":"`$BOOLEAN`","index$":1},{"active":true,"name":"description","req":false,"short":"Anime description","type":"`$STRING`","index$":2},{"active":true,"name":"description_html","req":false,"short":"HTML formatted description","type":"`$STRING`","index$":3},{"active":true,"name":"duration","req":false,"short":"Episode duration in minutes","type":"`$INTEGER`","index$":4},{"active":true,"name":"english","req":false,"short":"English names","type":"`$ARRAY`","index$":5},{"active":true,"name":"episodes","req":false,"short":"Number of episodes","type":"`$INTEGER`","index$":6},{"active":true,"name":"episodes_aired","req":false,"short":"Number of aired episodes","type":"`$INTEGER`","index$":7},{"active":true,"name":"favoured","req":false,"short":"Favoured by user","type":"`$BOOLEAN`","index$":8},{"active":true,"name":"franchise","req":false,"short":"Franchise name","type":"`$STRING`","index$":9},{"active":true,"name":"id","req":false,"short":"Anime ID","type":"`$INTEGER`","index$":10},{"active":true,"name":"image","req":false,"type":"`$OBJECT`","index$":11},{"active":true,"name":"japanese","req":false,"short":"Japanese names","type":"`$ARRAY`","index$":12},{"active":true,"name":"kind","req":false,"short":"Anime type","type":"`$STRING`","index$":13},{"active":true,"name":"myanimelist_id","req":false,"short":"MyAnimeList ID","type":"`$INTEGER`","index$":14},{"active":true,"name":"name","req":false,"short":"Anime name","type":"`$STRING`","index$":15},{"active":true,"name":"ongoing","req":false,"short":"Is ongoing","type":"`$BOOLEAN`","index$":16},{"active":true,"name":"rates_scores_stats","req":false,"short":"Rating statistics","type":"`$ARRAY`","index$":17},{"active":true,"name":"rates_statuses_stats","req":false,"short":"Status statistics","type":"`$ARRAY`","index$":18},{"active":true,"name":"rating","req":false,"short":"Age rating","type":"`$STRING`","index$":19},{"active":true,"format":"date","name":"released_on","req":false,"short":"Released date","type":"`$STRING`","index$":20},{"active":true,"name":"russian","req":false,"short":"Russian name","type":"`$STRING`","index$":21},{"active":true,"name":"score","req":false,"short":"Anime score","type":"`$STRING`","index$":22},{"active":true,"name":"status","req":false,"short":"Anime status","type":"`$STRING`","index$":23},{"active":true,"name":"synonyms","req":false,"short":"Alternative names","type":"`$ARRAY`","index$":24},{"active":true,"name":"thread_id","req":false,"short":"Thread ID","type":"`$INTEGER`","index$":25},{"active":true,"name":"topic_id","req":false,"short":"Topic ID","type":"`$INTEGER`","index$":26},{"active":true,"name":"url","req":false,"short":"Anime URL","type":"`$STRING`","index$":27}],"id":{"field":"id","name":"id"},"name":"anime","op":{"list":{"input":"data","name":"list","points":[{"active":true,"args":{"query":[{"active":true,"kind":"query","name":"duration","orig":"duration","reqd":false,"type":"`$STRING`","index$":0},{"active":true,"kind":"query","name":"franchise","orig":"franchise","reqd":false,"type":"`$STRING`","index$":1},{"active":true,"kind":"query","name":"genre","orig":"genre","reqd":false,"type":"`$STRING`","index$":2},{"active":true,"kind":"query","name":"genre_v2","orig":"genre_v2","reqd":false,"type":"`$STRING`","index$":3},{"active":true,"kind":"query","name":"kind","orig":"kind","reqd":false,"type":"`$STRING`","index$":4},{"active":true,"kind":"query","name":"limit","orig":"limit","reqd":false,"type":"`$INTEGER`","index$":5},{"active":true,"kind":"query","name":"order","orig":"order","reqd":false,"type":"`$STRING`","index$":6},{"active":true,"kind":"query","name":"page","orig":"page","reqd":false,"type":"`$INTEGER`","index$":7},{"active":true,"kind":"query","name":"rating","orig":"rating","reqd":false,"type":"`$STRING`","index$":8},{"active":true,"kind":"query","name":"score","orig":"score","reqd":false,"type":"`$NUMBER`","index$":9},{"active":true,"kind":"query","name":"season","orig":"season","reqd":false,"type":"`$STRING`","index$":10},{"active":true,"kind":"query","name":"status","orig":"status","reqd":false,"type":"`$STRING`","index$":11},{"active":true,"kind":"query","name":"studio","orig":"studio","reqd":false,"type":"`$STRING`","index$":12},{"active":true,"kind":"query","name":"type","orig":"type","reqd":false,"type":"`$STRING`","index$":13}]},"contract":{"id":"GET /animes","json":"{\"operationId\":\"getAnimes\",\"parameters\":[{\"description\":\"Page number for pagination\",\"in\":\"query\",\"name\":\"page\",\"required\":false,\"schema\":{\"maximum\":100000,\"minimum\":1,\"type\":\"integer\"}},{\"description\":\"Number of results per page (maximum 50)\",\"in\":\"query\",\"name\":\"limit\",\"required\":false,\"schema\":{\"maximum\":50,\"type\":\"integer\"}},{\"description\":\"Sort order for results\",\"in\":\"query\",\"name\":\"order\",\"required\":false,\"schema\":{\"enum\":[\"id\",\"id_desc\",\"ranked\",\"kind\",\"popularity\",\"name\",\"aired_on\",\"episodes\",\"status\",\"random\",\"ranked_random\",\"ranked_shiki\",\"created_at\",\"created_at_desc\",\"updated_at\",\"updated_at_desc\"],\"type\":\"string\"}},{\"deprecated\":true,\"description\":\"Deprecated parameter for anime type\",\"in\":\"query\",\"name\":\"type\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"Type of anime. Can be comma-separated list or use '!' for exclusion\",\"in\":\"query\",\"name\":\"kind\",\"required\":false,\"schema\":{\"enum\":[\"tv\",\"movie\",\"ova\",\"ona\",\"special\",\"tv_special\",\"music\",\"pv\",\"cm\",\"tv_13\",\"tv_24\",\"tv_48\"],\"type\":\"string\"}},{\"description\":\"Status of anime. Can be comma-separated list or use '!' for exclusion\",\"in\":\"query\",\"name\":\"status\",\"required\":false,\"schema\":{\"enum\":[\"anons\",\"ongoing\",\"released\"],\"type\":\"string\"}},{\"description\":\"Season filter. Examples: summer_2017, 2016, 2014_2016, 199x. Can be comma-separated list or use '!' for exclusion\",\"in\":\"query\",\"name\":\"season\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"Minimal anime score\",\"in\":\"query\",\"name\":\"score\",\"required\":false,\"schema\":{\"type\":\"number\"}},{\"description\":\"Duration category: S (less than 10 minutes), D (less than 30 minutes), F (more than 30 minutes)\",\"in\":\"query\",\"name\":\"duration\",\"required\":false,\"schema\":{\"enum\":[\"S\",\"D\",\"F\"],\"type\":\"string\"}},{\"description\":\"Age rating of the anime\",\"in\":\"query\",\"name\":\"rating\",\"required\":false,\"schema\":{\"enum\":[\"none\",\"g\",\"pg\",\"pg_13\",\"r\",\"r_plus\",\"rx\"],\"type\":\"string\"}},{\"description\":\"List of genre IDs separated by comma. Can use '!' for exclusion\",\"in\":\"query\",\"name\":\"genre\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"List of genre v2 IDs separated by comma. Can use '!' for exclusion\",\"in\":\"query\",\"name\":\"genre_v2\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"List of studio IDs separated by comma. Can use '!' for exclusion\",\"in\":\"query\",\"name\":\"studio\",\"required\":false,\"schema\":{\"type\":\"string\"}},{\"description\":\"List of franchises separated by comma. Can use '!' for exclusion\",\"in\":\"query\",\"name\":\"franchise\",\"required\":false,\"schema\":{\"type\":\"string\"}}],\"protocol\":\"http\",\"responses\":{\"200\":{\"content\":{\"application/json\":{\"schema\":{\"items\":{\"description\":\"Anime object\",\"properties\":{\"aired_on\":{\"description\":\"Aired date\",\"format\":\"date\",\"type\":\"string\"},\"anons\":{\"description\":\"Is in anons state\",\"type\":\"boolean\"},\"description\":{\"description\":\"Anime description\",\"type\":\"string\"},\"description_html\":{\"description\":\"HTML formatted description\",\"type\":\"string\"},\"duration\":{\"description\":\"Episode duration in minutes\",\"type\":\"integer\"},\"english\":{\"description\":\"English names\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"episodes\":{\"description\":\"Number of episodes\",\"type\":\"integer\"},\"episodes_aired\":{\"description\":\"Number of aired episodes\",\"type\":\"integer\"},\"favoured\":{\"description\":\"Favoured by user\",\"type\":\"boolean\"},\"franchise\":{\"description\":\"Franchise name\",\"type\":\"string\"},\"id\":{\"description\":\"Anime ID\",\"type\":\"integer\"},\"image\":{\"properties\":{\"original\":{\"description\":\"Original image URL\",\"type\":\"string\"},\"preview\":{\"description\":\"Preview image URL\",\"type\":\"string\"},\"x48\":{\"description\":\"48px image URL\",\"type\":\"string\"},\"x96\":{\"description\":\"96px image URL\",\"type\":\"string\"}},\"type\":\"object\"},\"japanese\":{\"description\":\"Japanese names\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"kind\":{\"description\":\"Anime type\",\"enum\":[\"tv\",\"movie\",\"ova\",\"ona\",\"special\",\"tv_special\",\"music\",\"pv\",\"cm\"],\"type\":\"string\"},\"myanimelist_id\":{\"description\":\"MyAnimeList ID\",\"type\":\"integer\"},\"name\":{\"description\":\"Anime name\",\"type\":\"string\"},\"ongoing\":{\"description\":\"Is ongoing\",\"type\":\"boolean\"},\"rates_scores_stats\":{\"description\":\"Rating statistics\",\"items\":{\"type\":\"object\"},\"type\":\"array\"},\"rates_statuses_stats\":{\"description\":\"Status statistics\",\"items\":{\"type\":\"object\"},\"type\":\"array\"},\"rating\":{\"description\":\"Age rating\",\"enum\":[\"none\",\"g\",\"pg\",\"pg_13\",\"r\",\"r_plus\",\"rx\"],\"type\":\"string\"},\"released_on\":{\"description\":\"Released date\",\"format\":\"date\",\"type\":\"string\"},\"russian\":{\"description\":\"Russian name\",\"type\":\"string\"},\"score\":{\"description\":\"Anime score\",\"type\":\"string\"},\"status\":{\"description\":\"Anime status\",\"enum\":[\"anons\",\"ongoing\",\"released\"],\"type\":\"string\"},\"synonyms\":{\"description\":\"Alternative names\",\"items\":{\"type\":\"string\"},\"type\":\"array\"},\"thread_id\":{\"description\":\"Thread ID\",\"type\":\"integer\"},\"topic_id\":{\"description\":\"Topic ID\",\"type\":\"integer\"},\"url\":{\"description\":\"Anime URL\",\"type\":\"string\"}},\"type\":\"object\"},\"type\":\"array\"}}},\"description\":\"Successful response with list of animes. Returns N+1 results if next page exists when requesting N elements\"},\"400\":{\"description\":\"Bad request - Invalid parameters\"},\"401\":{\"description\":\"Unauthorized - Invalid or missing OAuth2 token\"},\"429\":{\"description\":\"Rate limit exceeded (5rps or 90rpm)\"}},\"security\":[{\"oauth2\":[]}],\"securitySchemes\":{\"oauth2\":{\"description\":\"OAuth2 authentication. See https://shikimori.one/oauth for details. User-Agent header with your OAuth2 Application name is required.\",\"flows\":{\"authorizationCode\":{\"authorizationUrl\":\"https://shikimori.one/oauth/authorize\",\"scopes\":{},\"tokenUrl\":\"https://shikimori.one/oauth/token\"}},\"type\":\"oauth2\"}},\"securitySource\":\"definition\"}","source":"openapi3","version":1},"kind":"http","method":"GET","orig":"/animes","segments":[{"lit":"animes"}],"select":{"exist":["duration","franchise","genre","genre_v2","kind","limit","order","page","rating","score","season","status","studio","type"]},"transform":{"req":"`reqdata`","res":"`body`"},"index$":0}],"key$":"list"}},"relations":{"ancestors":[]},"key$":"anime","name__orig":"anime","Name":"Anime","name_":"anime","name-":"anime","NAME":"ANIME","index$":1}, {"active":true,"entity":"anime","key$":"BasicAnimeFlow","kind":"basic","name":"BasicAnimeFlow","param":{},"step":[{"active":true,"data":{},"input":{},"match":{},"op":"list","spec":[],"valid":[{"apply":"ItemExists","def":{"ref":"anime_ref01"}}],"index$":0}]}, 'Anime')
    }
    const client = setup.client
    const struct = setup.struct

    const isempty = struct.isempty
    const select = struct.select

    let anime_ref01_data = Object.values(setup.data.existing.anime)[0] as any

    // LIST
    const anime_ref01_ent = client.Anime()
    const anime_ref01_match: any = {}

    const anime_ref01_list = (await anime_ref01_ent.list(anime_ref01_match)).map((e: any) => e.data())


  })
})



function basicSetup(extra?: any) {
  // TODO: fix test def options
  const options: any = {} // null

  // TODO: needs test utility to resolve path
  const entityDataFile =
    Path.resolve(__dirname, 
      '../../../../.sdk/test/entity/anime/AnimeTestData.json')

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
    ['anime01','anime02','anime03'],
    {
      '`$PACK`': ['', {
        '`$KEY`': '`$COPY`',
        '`$VAL`': ['`$FORMAT`', 'upper', '`$COPY`']
      }]
    })

  const env = envOverride({
    'SHIKIMORI_TEST_ANIME_ENTID': idmap,
    'SHIKIMORI_TEST_LIVE': 'FALSE',
    'SHIKIMORI_TEST_EXPLAIN': 'FALSE',
    'SHIKIMORI_APIKEY': '',
  })

  idmap = env['SHIKIMORI_TEST_ANIME_ENTID']

  const live = 'TRUE' === env.SHIKIMORI_TEST_LIVE

  const transport = createLiveTransport()
  if (live) {
    const rawIds = process.env['SHIKIMORI_TEST_ANIME_ENTID']
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
  
