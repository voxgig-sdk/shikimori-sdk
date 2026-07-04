# Typed models for the Shikimori SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.
#
# These are TypedDicts, not dataclasses: the SDK ops return/accept plain dicts
# at runtime, and a TypedDict IS a dict shape, so the types match the runtime.
# Optional (req:false) keys are modelled as TypedDict key-optionality
# (total=False), split into a required base + total=False subclass when a type
# has both required and optional keys.

from __future__ import annotations

from typing import TypedDict, Any


class Achievement(TypedDict, total=False):
    id: int
    level: int
    neko_id: str
    progress: int
    user_id: int


class AchievementListMatch(TypedDict, total=False):
    id: int
    level: int
    neko_id: str
    progress: int
    user_id: int


class Anime(TypedDict, total=False):
    aired_on: str
    anon: bool
    description: str
    description_html: str
    duration: int
    english: list
    episode: int
    episodes_aired: int
    favoured: bool
    franchise: str
    id: int
    image: dict
    japanese: list
    kind: str
    myanimelist_id: int
    name: str
    ongoing: bool
    rates_scores_stat: list
    rates_statuses_stat: list
    rating: str
    released_on: str
    russian: str
    score: str
    status: str
    synonym: list
    thread_id: int
    topic_id: int
    url: str


class AnimeListMatch(TypedDict, total=False):
    aired_on: str
    anon: bool
    description: str
    description_html: str
    duration: int
    english: list
    episode: int
    episodes_aired: int
    favoured: bool
    franchise: str
    id: int
    image: dict
    japanese: list
    kind: str
    myanimelist_id: int
    name: str
    ongoing: bool
    rates_scores_stat: list
    rates_statuses_stat: list
    rating: str
    released_on: str
    russian: str
    score: str
    status: str
    synonym: list
    thread_id: int
    topic_id: int
    url: str
