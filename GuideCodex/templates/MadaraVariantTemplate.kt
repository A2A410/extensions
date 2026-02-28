package eu.kanade.tachiyomi.extension.<lang>.<source>

import eu.kanade.tachiyomi.multisrc.madara.Madara

/**
 * Use this when the target website is Madara-powered.
 * Keep overrides minimal so upstream multisrc fixes flow to your extension.
 */
class <SourceClassName> : Madara(
    "<Display Name>",
    "<lang_code>",
    "https://example.org",
) {
    override val mangaSubString = "manga"
    override val useLoadMoreRequest = LoadMoreStrategy.Selector("<next-selector>")

    // Optional:
    // override val dateFormat = SimpleDateFormat("MMMM dd, yyyy", Locale.US)
    // override val tagPrefix = "genre/"
    // override fun chapterListParse(response: Response): List<SChapter> { ... }
}
