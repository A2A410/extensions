package eu.kanade.tachiyomi.extension.template.supertmpl

/**
 * Compile-safe placeholder class.
 *
 * Purpose:
 * - Keep technical knobs baked into DEX as constants.
 * - Not yet wired for runtime source logic.
 */
object SuperTemplatePlaceholders {
    // CODEX_ADDED: marker for decompiled lookup
    const val CODEX_ADDED_MARKER = "CODEX_ADDED_SUPER_TEMPLATE_PLACEHOLDERS_V1"
    // Identity
    const val MODE = "html" // html | api
    const val PROFILE = "madara" // madara | mangathemesia | parsed | api
    const val EXT_NAME = "__EXT_NAME__"
    const val EXT_LANG = "__EXT_LANG__"
    const val EXT_SOURCE_ID = "__EXT_SOURCE_ID__"
    const val EXT_PACKAGE = "__EXT_PKG__"
    const val EXT_VERSION_NAME = "__EXT_VERSION_NAME__"
    const val EXT_VERSION_CODE = "__EXT_VERSION_CODE__"

    // URLs / endpoints
    const val BASE_URL = "__EXT_BASE_URL__"
    const val POPULAR_PATH = "__EXT_POPULAR_PATH__"
    const val LATEST_PATH = "__EXT_LATEST_PATH__"
    const val SEARCH_PATH = "__EXT_SEARCH_PATH__"

    // HTML selectors (or API key-path placeholders)
    const val CHAPTER_SELECTOR = "__EXT_CHAPTER_SELECTOR__"
    const val PAGE_SELECTOR = "__EXT_PAGE_SELECTOR__"

    // Required-first patch guidance (informational)
    const val PATCH_REQUIRED_FIRST = "MODE,PROFILE,PKG,NAME,LANG,SOURCE_ID,BASE_URL,POPULAR,SEARCH,CHAPTER,PAGE"

    // Optional-later patch guidance (informational)
    const val PATCH_OPTIONAL_LATER = "LATEST,DETAIL_SELECTORS,NEXT_PAGE,EXTRA_FLAGS"

    // Feature flags
    const val ENABLE_LATEST = "__EXT_ENABLE_LATEST__"
    const val HAS_FILTERS = false
    const val USE_LOAD_MORE_SELECTOR = false
    const val JSON_API_MODE = false
    const val NEEDS_CHAPTER_AJAX = false

    // Technical placeholders for future patch rounds
    const val NEXT_PAGE_SELECTOR = "<next-page-selector>"
    const val DETAILS_TITLE_SELECTOR = "<details-title-selector>"
    const val DETAILS_AUTHOR_SELECTOR = "<author-selector>"
    const val DETAILS_ARTIST_SELECTOR = "<artist-selector>"
    const val DETAILS_GENRE_SELECTOR = "<genre-selector>"
    const val DETAILS_DESC_SELECTOR = "<description-selector>"
    const val COVER_SELECTOR = "<cover-selector>"

    const val CHAPTER_KEY_PATH = "data.chapters[].url"
    const val PAGE_KEY_PATH = "data.pages[].imageUrl"
}
