package eu.kanade.tachiyomi.extension.<lang>.<source>

import eu.kanade.tachiyomi.network.GET
import eu.kanade.tachiyomi.network.POST
import eu.kanade.tachiyomi.source.model.FilterList
import eu.kanade.tachiyomi.source.model.MangasPage
import eu.kanade.tachiyomi.source.model.SChapter
import eu.kanade.tachiyomi.source.model.SManga
import eu.kanade.tachiyomi.source.model.Page
import eu.kanade.tachiyomi.source.online.ParsedHttpSource
import okhttp3.Request
import okhttp3.Response
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element
import java.text.SimpleDateFormat
import java.util.Locale

/**
 * Universal template for custom (non-multisrc) sources.
 * Replace <...> placeholders and CSS selectors with target-site values.
 */
class <SourceClassName> : ParsedHttpSource() {

    override val name: String = "<Display Name>"
    override val baseUrl: String = "https://example.org"
    override val lang: String = "<lang_code>" // e.g. en, id, all
    override val supportsLatest: Boolean = true

    private val dateFormat = SimpleDateFormat("MMMM d, yyyy", Locale.ENGLISH)

    // =========================
    // Popular
    // =========================
    override fun popularMangaRequest(page: Int): Request =
        GET("$baseUrl/<popular-path>?page=$page", headers)

    override fun popularMangaParse(response: Response): MangasPage {
        val doc = response.asJsoup()
        return MangasPage(
            mangas = doc.select("<popular-card-selector>").map(::popularFromElement),
            hasNextPage = doc.select("<next-page-selector>").isNotEmpty(),
        )
    }

    private fun popularFromElement(element: Element): SManga = SManga.create().apply {
        title = element.selectFirst("<title-selector>")?.text().orEmpty()
        thumbnail_url = element.selectFirst("<thumb-selector>")?.absUrl("src")
        setUrlWithoutDomain(element.selectFirst("a")?.attr("href").orEmpty())
    }

    // =========================
    // Latest
    // =========================
    override fun latestUpdatesRequest(page: Int): Request =
        GET("$baseUrl/<latest-path>?page=$page", headers)

    override fun latestUpdatesParse(response: Response): MangasPage =
        popularMangaParse(response)

    // =========================
    // Search + Filters
    // =========================
    override fun searchMangaRequest(page: Int, query: String, filters: FilterList): Request {
        val q = query.trim()
        val url = if (q.isNotEmpty()) {
            "$baseUrl/<search-path>?q=$q&page=$page"
        } else {
            "$baseUrl/<browse-path>?page=$page"
        }
        return GET(url, headers)
    }

    override fun searchMangaParse(response: Response): MangasPage =
        popularMangaParse(response)

    override fun getFilterList(): FilterList = FilterList(
        // Add Filter.Select, Filter.CheckBox, etc.
    )

    // =========================
    // Details
    // =========================
    override fun mangaDetailsRequest(manga: SManga): Request =
        GET(baseUrl + manga.url, headers)

    override fun mangaDetailsParse(document: Document): SManga = SManga.create().apply {
        title = document.selectFirst("<details-title-selector>")?.text().orEmpty()
        author = document.selectFirst("<author-selector>")?.text()
        artist = document.selectFirst("<artist-selector>")?.text()
        genre = document.select("<genre-selector>").joinToString { it.text() }
        status = SManga.ONGOING // map website labels -> ONGOING/COMPLETED/HIATUS/CANCELLED
        description = document.selectFirst("<description-selector>")?.text()
        thumbnail_url = document.selectFirst("<cover-selector>")?.absUrl("src")
    }

    // =========================
    // Chapters
    // =========================
    override fun chapterListRequest(manga: SManga): Request =
        GET(baseUrl + manga.url, headers)

    override fun chapterListParse(response: Response): List<SChapter> {
        val doc = response.asJsoup()
        return doc.select("<chapter-item-selector>").map(::chapterFromElement)
    }

    private fun chapterFromElement(element: Element): SChapter = SChapter.create().apply {
        name = element.selectFirst("<chapter-title-selector>")?.text().orEmpty()
        date_upload = element.selectFirst("<chapter-date-selector>")
            ?.text()
            ?.let(::parseChapterDate)
            ?: 0L
        setUrlWithoutDomain(element.selectFirst("a")?.attr("href").orEmpty())
    }

    private fun parseChapterDate(dateText: String): Long =
        runCatching { dateFormat.parse(dateText)?.time ?: 0L }.getOrDefault(0L)

    // =========================
    // Pages
    // =========================
    override fun pageListRequest(chapter: SChapter): Request =
        GET(baseUrl + chapter.url, headers)

    override fun pageListParse(document: Document): List<Page> =
        document.select("<page-image-selector>").mapIndexed { index, img ->
            Page(index = index, imageUrl = img.absUrl("src"))
        }

    override fun imageUrlParse(document: Document): String =
        throw UnsupportedOperationException("Not used when pageListParse returns URLs")
}
