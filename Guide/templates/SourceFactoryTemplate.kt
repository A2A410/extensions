package eu.kanade.tachiyomi.extension.all.mysource

import eu.kanade.tachiyomi.source.Source
import eu.kanade.tachiyomi.source.SourceFactory

/**
 * Template for a source factory to group multiple sources.
 */
class MySourceFactory : SourceFactory {
    override fun createSources(): List<Source> = listOf(
        MySource("en"),
        MySource("es"),
        MySource("fr"),
        MySource("ja")
    )
}

class MySource(override val lang: String) : ParsedHttpSource() {
    // ... implement as in ParsedHttpSourceTemplate.kt, but using the lang parameter
    override val name = "My Source ($lang)"
    override val baseUrl = "https://www.example.com"
}
