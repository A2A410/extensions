package eu.kanade.tachiyomi.extension.<lang>.<source>

import eu.kanade.tachiyomi.multisrc.mangathemesia.MangaThemesia

/**
 * Use when site is MangaThemesia/Genkan-like.
 */
class <SourceClassName> : MangaThemesia(
    "<Display Name>",
    "https://example.org",
    "<lang_code>",
) {
    override val versionId = 1

    // Optional per-site fixes:
    // override val seriesAuthorSelector = "div.author a"
    // override val pageSelector = "div.page-break img"
}
