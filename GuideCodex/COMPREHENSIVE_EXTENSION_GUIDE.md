# GuideCodex: Comprehensive Extension Engineering Guide for This Repository

## 1) What this repository is (and is not)

This repository is a **distribution repository** of already-built extension APKs and icons.

- `apk/` contains compiled Android extension APK artifacts (1251 APKs in this snapshot).
- `icon/` contains one icon per extension package.
- `README.md` points to upstream source code (`keiyoushi/extensions-source`) and usage/install info.

So the workflow here is **artifact analysis + packaging insights**, while actual authoring source code lives upstream.

---

## 2) Whole-repo APK analysis summary

### Inventory findings

From automated analysis over all files in `apk/`:

- Total APKs: **1251**
- Unique sources: **1249**
- Language buckets in file naming: `en`, `all`, `pt`, `es`, `ja`, `id`, `tr`, `ar`, `fr`, `zh`, `vi`, `th`, `ru`, `it`, `ko`, `uk`, `ca`, `de`, `pl`, `bg`, `cs`
- Version span in filenames: **1.4.1 → 1.4.206**

These are recorded in:
- `GuideCodex/analysis_stats.txt`
- `GuideCodex/apk_inventory.csv`

### Structural findings (APK internals)

Across all APKs, the common structure is:

- `classes.dex` (compiled Kotlin/Java logic)
- `AndroidManifest.xml` (binary Android manifest)
- `resources.arsc`
- `META-INF/CERT.SF`, `META-INF/CERT.RSA`, `META-INF/MANIFEST.MF`
- Several PNG resources (launcher-related)
- Optional `assets/i18n/messages_*.properties` for localized setting/filter strings

### Signing findings

Certificate checks on sampled APKs show consistent signer identity:

- Owner/Issuer: `CN=AntsyLich, O=WorkshopOfAntsyLich`
- SHA256 fingerprint: `9A:DD:65:5A:78:E9:6C:4E:C7:A5:3E:F8:9D:CC:B5:57:CB:5D:76:74:89:FA:C5:E7:85:D6:71:A5:A7:5D:4D:A2`

### Icon/APK parity

- `apk/` count = 1251
- `icon/` count = 1251
- Missing icon matches: 0
- Orphan icons: 0

---

## 3) Naming and packaging model (inferred from all APKs)

## File naming convention

APKs follow:

`tachiyomi-<lang>.<source>-v<semver>.apk`

Examples:
- `tachiyomi-en.toonily-v1.4.59.apk`
- `tachiyomi-all.mangaplus-v1.4.57.apk`

## Package naming convention

Dex class descriptors consistently include:

`eu/kanade/tachiyomi/extension/<lang>/<source>/...`

This matches APK file naming exactly (`lang.source` pair alignment confirmed on all APKs).

## Icon naming convention

Icons are named by package:

`eu.kanade.tachiyomi.extension.<lang>.<source>.png`

This mirrors the extension package identity used by the app and indexers.

---

## 4) Functional architecture of an extension (how functions work)

Even without full source in this repo, `classes.dex` signatures and known Tachiyomi-compatible extension architecture indicate each extension implements a source contract that provides:

1. **Popular manga/comics list**
2. **Latest updates list**
3. **Search** (query + filters)
4. **Manga details** (title, author, status, genres, thumbnail, description)
5. **Chapter list**
6. **Page/image list** per chapter
7. Optional **preferences** and custom filters

Typical network & parsing stack (visible in dex strings):

- OkHttp (`okhttp3.Response` etc.)
- Jsoup (`org.jsoup.nodes.Document`)
- Kotlin serialization (`kotlinx.serialization`)

This means extension functions generally work as:

- Build HTTP request(s)
- Parse HTML/JSON responses
- Map into app models
- Return paginated results
- Expose settings via preference keys and localized `messages_*.properties`

---

## 5) Multi-source templates found across all APKs

Dex-level scanning detected shared template frameworks embedded in many source APKs.

Most common detected template families in this snapshot:

- `madara`: 357
- `mangathemesia`: 148
- `zeistmanga`: 32
- `keyoapp`: 25
- plus smaller families (`pizzareader`, `wpcomics`, `foolslide`, `mccms`, `mangabox`)

Representative examples are in `GuideCodex/multisrc_examples.txt`.

Why this matters:

- New extensions are often easiest to build by inheriting a compatible multisrc base and overriding selectors/endpoints/options.
- This reduces maintenance and gives shared fixes across many sites.

---

## 6) End-to-end: how to make an extension (practical workflow)

Because this repo ships binaries, authoring happens in upstream extension-source repos. Still, the engineering lifecycle is consistent:

1. **Classify target website**
   - Is it a known engine family (e.g., Madara/MangaThemesia/custom API)?
2. **Choose implementation mode**
   - Reuse multisrc template (preferred) vs fully custom source class.
3. **Define identity**
   - `lang`, `source`, package id, display name, version.
4. **Implement source contract**
   - popular/latest/search/details/chapters/pages + filters/preferences.
5. **Internationalize setting/filter labels**
   - add `assets/i18n/messages_*.properties` entries as needed.
6. **Add icon asset**
   - ensure icon file package naming parity.
7. **Compile APK artifact**
   - produce `tachiyomi-<lang>.<source>-v<version>.apk`.
8. **Sign artifact**
   - with project signing identity.
9. **Index + publish**
   - ensure extension index and icon pointers are updated.
10. **Regression checks**
   - verify browsing/search/chapter/page parsing and rate-limit/bypass behavior.

---

## 7) Reverse-engineering notes from APK-only analysis

What can be extracted robustly from APK-only repos:

- Naming/version/index conventions
- Packaging structure
- Presence of i18n resources
- Template family fingerprints (from class descriptors)
- Signer metadata

What requires upstream source/decompilation tools for deeper certainty:

- Exact parser selectors
- Request header/cookie strategies
- Login/cloudflare bypass details
- Per-site filters and advanced preferences logic

---

## 8) “Diff view”: my understanding vs repository evidence vs external lookup

| Topic | What I inferred from APKs in this repo | What is explicitly present in repo files | External lookup status |
|---|---|---|---|
| Repo purpose | Binary extension distribution repository | `README.md` links to install URL and source repo | Internet access was blocked (HTTP 403 CONNECT), so no live web docs fetched |
| Architecture | Tachiyomi-compatible source contract with OkHttp/Jsoup/Kotlin serialization | Not documented deeply in repo text; inferred from `classes.dex` strings | Could not fetch upstream docs due network policy |
| Authoring location | Done in upstream source repo(s), not here | `README.md` links to `keiyoushi/extensions-source` | Could not open URL from environment |
| Build/sign model | Per-extension APK signed artifacts, one icon per package | Observed from `apk/` + `icon/` inventories | Could not compare with external CI docs |

---

## 9) Key files generated for this guide

- `GuideCodex/apk_inventory.csv`: per-APK inventory and detected multisrc hints.
- `GuideCodex/analysis_stats.txt`: aggregate counts and distribution stats.
- `GuideCodex/multisrc_examples.txt`: representative template indicator strings.
- `GuideCodex/COMPREHENSIVE_EXTENSION_GUIDE.md`: this guide.

