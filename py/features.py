# Shikimori SDK feature factory

from feature.base_feature import ShikimoriBaseFeature
from feature.test_feature import ShikimoriTestFeature


def _make_feature(name):
    features = {
        "base": lambda: ShikimoriBaseFeature(),
        "test": lambda: ShikimoriTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()
