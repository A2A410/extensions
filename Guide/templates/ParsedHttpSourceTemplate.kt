package eu.kanade.tachiyomi.extension.all.mysource

import eu.kanade.tachiyomi.source.model.FilterList
import eu.kanade.tachiyomi.source.model.MangasPage
import eu.kanade.tachiyomi.source.model.Page
import eu.kanade.tachiyomi.source.model.SChapter
import eu.kanade.tachiyomi.source.model.SManga
import eu.kanade.tachiyomi.source.online.ParsedHttpSource
import okhttp3.Request
import okhttp3.Response
import org.jsoup.nodes.Document
import org.jsoup.nodes.Element

/**
 * Template for a standard HTML-based source using JSoup.
 */
class MySource : ParsedHttpSource() {

    override val name = "My Source"

    override val baseUrl = "https://www.example.com"

    override val lang = "en"

    override val supportsLatest = true

    // --- Popular Manga ---

    override fun popularMangaRequest(page: Int): Request {
        return GET("$baseUrl/popular?page=$page", headers)
    }

    override fun popularMangaSelector() = ".manga-item"

    override fun popularMangaFromElement(element: Element): SManga {
        return SManga.create().apply {
            title = element.select(".title").text()
            url = element.select("a").attr("href")
            thumbnail_url = element.select("img").attr("abs:src")
        }
    }

    override fun popularMangaNextPageSelector() = "a.next-page"

    // --- Latest Manga ---

    override fun latestUpdatesRequest(page: Int): Request {
        return GET("$baseUrl/latest?page=$page", headers)
    }

    override fun latestUpdatesSelector() = popularMangaSelector()

    override fun latestUpdatesFromElement(element: Element) = popularMangaFromElement(element)

    override fun latestUpdatesNextPageSelector() = popularMangaNextPageSelector()

    // --- Search ---

    override fun searchMangaRequest(page: Int, query: String, filters: FilterList): Request {
        // Implement search logic, handling query and potential filters
        return GET("$baseUrl/search?q=$query&page=$page", headers)
    }

    override fun searchMangaSelector() = popularMangaSelector()

    override fun searchMangaFromElement(element: Element) = popularMangaFromElement(element)

    override fun searchMangaNextPageSelector() = popularMangaNextPageSelector()

    // --- Manga Details ---

    override fun mangaDetailsParse(document: Document): SManga {
        return SManga.create().apply {
            author = document.select(".author").text()
            description = document.select(".description").text()
            genre = document.select(".genre").joinToString { it.text() }
            status = when (document.select(".status").text()) {
                "Ongoing" -> SManga.ONGOING
                "Completed" -> SManga.COMPLETED
                else -> SManga.UNKNOWN
            }
        }
    }

    // --- Chapter List ---

    override fun chapterListSelector() = ".chapter-list-item"

    override fun chapterFromElement(element: Element): SChapter {
        return SChapter.create().apply {
            name = element.select(".chapter-name").text()
            url = element.select("a").attr("href")
            date_upload = 0L // Implement date parsing if available
        }
    }

    // --- Page List ---

    override fun pageListParse(document: Document): List<Page> {
        return document.select(".page-image").mapIndexed { index, element ->
            Page(index, "", element.attr("abs:src"))
        }
    }

    override fun imageUrlParse(document: Document): String {
        throw UnsupportedOperationException("Not used")
    }
}
