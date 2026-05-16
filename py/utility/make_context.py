# Shikimori SDK utility: make_context

from core.context import ShikimoriContext


def make_context_util(ctxmap, basectx):
    return ShikimoriContext(ctxmap, basectx)
