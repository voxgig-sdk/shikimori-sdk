# Shikimori SDK feature factory

from shikimori_sdk.feature.base_feature import ShikimoriBaseFeature
from shikimori_sdk.feature.ratelimit_feature import ShikimoriRatelimitFeature
from shikimori_sdk.feature.retry_feature import ShikimoriRetryFeature
from shikimori_sdk.feature.test_feature import ShikimoriTestFeature
from shikimori_sdk.feature.timeout_feature import ShikimoriTimeoutFeature


_FEATURES = {
    "base": lambda: ShikimoriBaseFeature(),
    "ratelimit": lambda: ShikimoriRatelimitFeature(),
    "retry": lambda: ShikimoriRetryFeature(),
    "test": lambda: ShikimoriTestFeature(),
    "timeout": lambda: ShikimoriTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES
