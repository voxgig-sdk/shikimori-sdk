# Shikimori SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

ShikimoriUtility.registrar = ->(u) {
  u.clean = ShikimoriUtilities::Clean
  u.done = ShikimoriUtilities::Done
  u.make_error = ShikimoriUtilities::MakeError
  u.feature_add = ShikimoriUtilities::FeatureAdd
  u.feature_hook = ShikimoriUtilities::FeatureHook
  u.feature_init = ShikimoriUtilities::FeatureInit
  u.fetcher = ShikimoriUtilities::Fetcher
  u.make_fetch_def = ShikimoriUtilities::MakeFetchDef
  u.make_context = ShikimoriUtilities::MakeContext
  u.make_options = ShikimoriUtilities::MakeOptions
  u.make_request = ShikimoriUtilities::MakeRequest
  u.make_response = ShikimoriUtilities::MakeResponse
  u.make_result = ShikimoriUtilities::MakeResult
  u.make_point = ShikimoriUtilities::MakePoint
  u.make_spec = ShikimoriUtilities::MakeSpec
  u.make_url = ShikimoriUtilities::MakeUrl
  u.param = ShikimoriUtilities::Param
  u.prepare_auth = ShikimoriUtilities::PrepareAuth
  u.prepare_body = ShikimoriUtilities::PrepareBody
  u.prepare_headers = ShikimoriUtilities::PrepareHeaders
  u.prepare_method = ShikimoriUtilities::PrepareMethod
  u.prepare_params = ShikimoriUtilities::PrepareParams
  u.prepare_path = ShikimoriUtilities::PreparePath
  u.prepare_query = ShikimoriUtilities::PrepareQuery
  u.result_basic = ShikimoriUtilities::ResultBasic
  u.result_body = ShikimoriUtilities::ResultBody
  u.result_headers = ShikimoriUtilities::ResultHeaders
  u.transform_request = ShikimoriUtilities::TransformRequest
  u.transform_response = ShikimoriUtilities::TransformResponse
}
