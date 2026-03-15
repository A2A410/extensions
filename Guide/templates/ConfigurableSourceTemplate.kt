package eu.kanade.tachiyomi.extension.all.mysource

import android.app.Application
import android.content.SharedPreferences
import androidx.preference.PreferenceScreen
import eu.kanade.tachiyomi.source.ConfigurableSource
import eu.kanade.tachiyomi.source.online.ParsedHttpSource
import uy.kohesive.injekt.Injekt
import uy.kohesive.injekt.api.get

/**
 * Template for a source with user-configurable settings.
 */
class MyConfigurableSource : ParsedHttpSource(), ConfigurableSource {

    override val name = "My Configurable Source"
    override val baseUrl = "https://www.example.com"
    override val lang = "en"

    private val preferences: SharedPreferences by lazy {
        Injekt.get<Application>().getSharedPreferences("source_$id", 0x0000)
    }

    override fun setupPreferenceScreen(screen: PreferenceScreen) {
        val qualityPref = androidx.preference.ListPreference(screen.context).apply {
            key = "image_quality"
            title = "Image Quality"
            entries = arrayOf("Low", "High")
            entryValues = arrayOf("low", "high")
            summary = "%s"
            setDefaultValue("high")
        }
        screen.addPreference(qualityPref)
    }

    // Example of using the preference
    private fun getQuality() = preferences.getString("image_quality", "high")

    // ... implement other methods as in ParsedHttpSourceTemplate.kt
    override fun popularMangaSelector() = ""
    override fun popularMangaFromElement(element: org.jsoup.nodes.Element) = eu.kanade.tachiyomi.source.model.SManga.create()
    override fun popularMangaNextPageSelector() = ""
    override fun popularMangaRequest(page: Int) = GET(baseUrl)
    override fun latestUpdatesFromElement(element: org.jsoup.nodes.Element) = eu.kanade.tachiyomi.source.model.SManga.create()
    override fun latestUpdatesNextPageSelector() = ""
    override fun latestUpdatesRequest(page: Int) = GET(baseUrl)
    override fun latestUpdatesSelector() = ""
    override fun mangaDetailsParse(document: org.jsoup.nodes.Document) = eu.kanade.tachiyomi.source.model.SManga.create()
    override fun chapterFromElement(element: org.jsoup.nodes.Element) = eu.kanade.tachiyomi.source.model.SChapter.create()
    override fun chapterListSelector() = ""
    override fun pageListParse(document: org.jsoup.nodes.Document) = emptyList<eu.kanade.tachiyomi.source.model.Page>()
    override fun imageUrlParse(document: org.jsoup.nodes.Document) = ""
    override fun searchMangaFromElement(element: org.jsoup.nodes.Element) = eu.kanade.tachiyomi.source.model.SManga.create()
    override fun searchMangaNextPageSelector() = ""
    override fun searchMangaRequest(page: Int, query: String, filters: eu.kanade.tachiyomi.source.model.FilterList) = GET(baseUrl)
    override fun searchMangaSelector() = ""
}
