<?php
declare(strict_types=1);

// Shikimori SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

ShikimoriUtility::setRegistrar(function (ShikimoriUtility $u): void {
    $u->clean = [ShikimoriClean::class, 'call'];
    $u->done = [ShikimoriDone::class, 'call'];
    $u->make_error = [ShikimoriMakeError::class, 'call'];
    $u->feature_add = [ShikimoriFeatureAdd::class, 'call'];
    $u->feature_hook = [ShikimoriFeatureHook::class, 'call'];
    $u->feature_init = [ShikimoriFeatureInit::class, 'call'];
    $u->fetcher = [ShikimoriFetcher::class, 'call'];
    $u->make_fetch_def = [ShikimoriMakeFetchDef::class, 'call'];
    $u->make_context = [ShikimoriMakeContext::class, 'call'];
    $u->make_options = [ShikimoriMakeOptions::class, 'call'];
    $u->make_request = [ShikimoriMakeRequest::class, 'call'];
    $u->make_response = [ShikimoriMakeResponse::class, 'call'];
    $u->make_result = [ShikimoriMakeResult::class, 'call'];
    $u->make_point = [ShikimoriMakePoint::class, 'call'];
    $u->make_spec = [ShikimoriMakeSpec::class, 'call'];
    $u->make_url = [ShikimoriMakeUrl::class, 'call'];
    $u->param = [ShikimoriParam::class, 'call'];
    $u->prepare_auth = [ShikimoriPrepareAuth::class, 'call'];
    $u->prepare_body = [ShikimoriPrepareBody::class, 'call'];
    $u->prepare_headers = [ShikimoriPrepareHeaders::class, 'call'];
    $u->prepare_method = [ShikimoriPrepareMethod::class, 'call'];
    $u->prepare_params = [ShikimoriPrepareParams::class, 'call'];
    $u->prepare_path = [ShikimoriPreparePath::class, 'call'];
    $u->prepare_query = [ShikimoriPrepareQuery::class, 'call'];
    $u->result_basic = [ShikimoriResultBasic::class, 'call'];
    $u->result_body = [ShikimoriResultBody::class, 'call'];
    $u->result_headers = [ShikimoriResultHeaders::class, 'call'];
    $u->transform_request = [ShikimoriTransformRequest::class, 'call'];
    $u->transform_response = [ShikimoriTransformResponse::class, 'call'];
});
