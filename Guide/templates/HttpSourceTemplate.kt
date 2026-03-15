package eu.kanade.tachiyomi.extension.all.mysource

import eu.kanade.tachiyomi.source.model.FilterList
import eu.kanade.tachiyomi.source.model.MangasPage
import eu.kanade.tachiyomi.source.model.Page
import eu.kanade.tachiyomi.source.model.SChapter
import eu.kanade.tachiyomi.source.model.SManga
import eu.kanade.tachiyomi.source.online.HttpSource
import okhttp3.Request
import okhttp3.Response
import kotlinx.serialization.json.Json
import kotlinx.serialization.decodeFromString
import uy.kohesive.injekt.injectLazy

/**
 * Template for an API-based source using JSON.
 */
class MyApiSource : HttpSource() {

    override val name = "My API Source"

    override val baseUrl = "https://api.example.com"

    override val lang = "en"

    override val supportsLatest = true

    private val json: Json by injectLazy()

    // --- Popular Manga ---

    override fun popularMangaRequest(page: Int): Request {
        return GET("$baseUrl/v1/popular?page=$page", headers)
    }

    override fun popularMangaParse(response: Response): MangasPage {
        val jsonString = response.body.string()
        // val result = json.decodeFromString<MyPopularResponse>(jsonString)
        // Map result to MangasPage
        return MangasPage(emptyList(), false)
    }

    // --- Latest Manga ---

    override fun latestUpdatesRequest(page: Int): Request {
        return GET("$baseUrl/v1/latest?page=$page", headers)
    }

    override fun latestUpdatesParse(response: Response) = popularMangaParse(response)

    // --- Search ---

    override fun searchMangaRequest(page: Int, query: String, filters: FilterList): Request {
        return GET("$baseUrl/v1/search?q=$query&page=$page", headers)
    }

    override fun searchMangaParse(response: Response) = popularMangaParse(response)

    // --- Manga Details ---

    override fun mangaDetailsParse(response: Response): SManga {
        val jsonString = response.body.string()
        // val details = json.decodeFromString<MyDetailsResponse>(jsonString)
        return SManga.create()
    }

    // --- Chapter List ---

    override fun chapterListParse(response: Response): List<SChapter> {
        val jsonString = response.body.string()
        // val chapters = json.decodeFromString<List<MyChapterDto>>(jsonString)
        return emptyList()
    }

    // --- Page List ---

    override fun pageListParse(response: Response): List<Page> {
        val jsonString = response.body.string()
        // val pages = json.decodeFromString<MyPageResponse>(jsonString)
        return emptyList()
    }

    override fun imageUrlParse(response: Response): String {
        throw UnsupportedOperationException("Not used")
    }
}
