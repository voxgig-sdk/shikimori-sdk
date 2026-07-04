# Typed models for the Shikimori SDK.
#
# GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
# params (op.<name>.points[].args.params[]). Field/param types come from the
# canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
# @voxgig/apidef VALID_CANON). Do not edit by hand.

from __future__ import annotations

from dataclasses import dataclass
from typing import Optional, Any


@dataclass
class Achievement:
    id: Optional[int] = None
    level: Optional[int] = None
    neko_id: Optional[str] = None
    progress: Optional[int] = None
    user_id: Optional[int] = None


@dataclass
class AchievementListMatch:
    id: Optional[int] = None
    level: Optional[int] = None
    neko_id: Optional[str] = None
    progress: Optional[int] = None
    user_id: Optional[int] = None


@dataclass
class Anime:
    aired_on: Optional[str] = None
    anon: Optional[bool] = None
    description: Optional[str] = None
    description_html: Optional[str] = None
    duration: Optional[int] = None
    english: Optional[list] = None
    episode: Optional[int] = None
    episodes_aired: Optional[int] = None
    favoured: Optional[bool] = None
    franchise: Optional[str] = None
    id: Optional[int] = None
    image: Optional[dict] = None
    japanese: Optional[list] = None
    kind: Optional[str] = None
    myanimelist_id: Optional[int] = None
    name: Optional[str] = None
    ongoing: Optional[bool] = None
    rates_scores_stat: Optional[list] = None
    rates_statuses_stat: Optional[list] = None
    rating: Optional[str] = None
    released_on: Optional[str] = None
    russian: Optional[str] = None
    score: Optional[str] = None
    status: Optional[str] = None
    synonym: Optional[list] = None
    thread_id: Optional[int] = None
    topic_id: Optional[int] = None
    url: Optional[str] = None


@dataclass
class AnimeListMatch:
    aired_on: Optional[str] = None
    anon: Optional[bool] = None
    description: Optional[str] = None
    description_html: Optional[str] = None
    duration: Optional[int] = None
    english: Optional[list] = None
    episode: Optional[int] = None
    episodes_aired: Optional[int] = None
    favoured: Optional[bool] = None
    franchise: Optional[str] = None
    id: Optional[int] = None
    image: Optional[dict] = None
    japanese: Optional[list] = None
    kind: Optional[str] = None
    myanimelist_id: Optional[int] = None
    name: Optional[str] = None
    ongoing: Optional[bool] = None
    rates_scores_stat: Optional[list] = None
    rates_statuses_stat: Optional[list] = None
    rating: Optional[str] = None
    released_on: Optional[str] = None
    russian: Optional[str] = None
    score: Optional[str] = None
    status: Optional[str] = None
    synonym: Optional[list] = None
    thread_id: Optional[int] = None
    topic_id: Optional[int] = None
    url: Optional[str] = None

