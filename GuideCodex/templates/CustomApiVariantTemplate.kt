package eu.kanade.tachiyomi.extension.<lang>.<source>

import eu.kanade.tachiyomi.network.GET
import eu.kanade.tachiyomi.source.model.*
import eu.kanade.tachiyomi.source.online.HttpSource
import kotlinx.serialization.Serializable
import kotlinx.serialization.json.Json
import okhttp3.Request
import okhttp3.Response

/**
 * Use when the site has stable JSON APIs and HTML parsing is unnecessary.
 */
class <SourceClassName> : HttpSource() {
    override val name = "<Display Name>"
    override val baseUrl = "https://api.example.org"
    override val lang = "<lang_code>"
    override val supportsLatest = true

    private val json = Json { ignoreUnknownKeys = true }

    override fun popularMangaRequest(page: Int): Request = GET("$baseUrl/v1/popular?page=$page", headers)
    override fun latestUpdatesRequest(page: Int): Request = GET("$baseUrl/v1/latest?page=$page", headers)
    override fun searchMangaRequest(page: Int, query: String, filters: FilterList): Request =
        GET("$baseUrl/v1/search?q=$query&page=$page", headers)

    override fun popularMangaParse(response: Response): MangasPage = parsePage(response)
    override fun latestUpdatesParse(response: Response): MangasPage = parsePage(response)
    override fun searchMangaParse(response: Response): MangasPage = parsePage(response)

    private fun parsePage(response: Response): MangasPage {
        val dto = json.decodeFromString<ApiListResponse>(response.body.string())
        return MangasPage(
            mangas = dto.items.map {
                SManga.create().apply {
                    title = it.title
                    thumbnail_url = it.cover
                    url = "/title/${it.id}"
                }
            },
            hasNextPage = dto.hasNext,
        )
    }

    override fun mangaDetailsRequest(manga: SManga): Request = GET("$baseUrl/v1${manga.url}", headers)
    override fun mangaDetailsParse(response: Response): SManga = SManga.create() // map detail DTO

    override fun chapterListRequest(manga: SManga): Request = GET("$baseUrl/v1${manga.url}/chapters", headers)
    override fun chapterListParse(response: Response): List<SChapter> = emptyList() // map DTO

    override fun pageListRequest(chapter: SChapter): Request = GET("$baseUrl/v1${chapter.url}/pages", headers)
    override fun pageListParse(response: Response): List<Page> = emptyList() // map DTO

    override fun imageUrlRequest(page: Page): Request = GET(page.imageUrl!!, headers)
    override fun imageUrlParse(response: Response): String = response.request.url.toString()

    @Serializable
    private data class ApiListResponse(val items: List<ApiManga>, val hasNext: Boolean)
    @Serializable
    private data class ApiManga(val id: String, val title: String, val cover: String)
}
