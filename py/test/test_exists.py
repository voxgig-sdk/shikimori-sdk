# ProjectName SDK exists test

import pytest
from shikimori_sdk import ShikimoriSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = ShikimoriSDK.test(None, None)
        assert testsdk is not None
