export interface Achievement {
    id?: number;
    level?: number;
    neko_id?: string;
    progress?: number;
    user_id?: number;
}
export interface AchievementListMatch {
    user_id: number;
}
export interface Anime {
    aired_on?: string;
    anons?: boolean;
    description?: string;
    description_html?: string;
    duration?: number;
    english?: any[];
    episodes?: number;
    episodes_aired?: number;
    favoured?: boolean;
    franchise?: string;
    id?: number;
    image?: Record<string, any>;
    japanese?: any[];
    kind?: string;
    myanimelist_id?: number;
    name?: string;
    ongoing?: boolean;
    rates_scores_stats?: any[];
    rates_statuses_stats?: any[];
    rating?: string;
    released_on?: string;
    russian?: string;
    score?: string;
    status?: string;
    synonyms?: any[];
    thread_id?: number;
    topic_id?: number;
    url?: string;
}
export interface AnimeListMatch {
    duration?: string;
    franchise?: string;
    genre?: string;
    genre_v2?: string;
    kind?: string;
    limit?: number;
    order?: string;
    page?: number;
    rating?: string;
    score?: number;
    season?: string;
    status?: string;
    studio?: string;
    type?: string;
}
