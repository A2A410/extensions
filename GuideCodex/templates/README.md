# Extension Templates (GuideCodex)

Use these templates as starter files when building a new extension in the upstream source repository.

## Which template to choose

1. `MadaraVariantTemplate.kt` → Use for Madara engine sites.
2. `MangaThemesiaVariantTemplate.kt` → Use for MangaThemesia-like sites.
3. `CustomApiVariantTemplate.kt` → Use for pure JSON API sites.
4. `UniversalExtensionTemplate.kt` → Use when none of the above fits.

## Fast start checklist

- Copy the closest template.
- Replace all `<...>` placeholders.
- Implement/adjust selectors and request paths.
- Add i18n keys in `assets/i18n/messages_*.properties` as needed.
- Verify file/package naming convention alignment:
  - package: `eu.kanade.tachiyomi.extension.<lang>.<source>`
  - apk: `tachiyomi-<lang>.<source>-v<version>.apk`
  - icon: `eu.kanade.tachiyomi.extension.<lang>.<source>.png`
- Run smoke checks for popular/latest/search/details/chapters/pages.

