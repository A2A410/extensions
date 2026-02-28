# Comprehensive Guide to Keiyoushi Extensions and Extension Making

This guide provides a detailed analysis of the Keiyoushi extensions repository and a comprehensive walkthrough of how Tachiyomi/Mihon extensions are built, from core functions to becoming a distributed APK.

---

## 1. Repository Analysis

The Keiyoushi repository is a distribution point for Tachiyomi-compatible extensions. It serves as a static site that Mihon and its variants can crawl to discover and download extensions.

### Structure:
- **`apk/`**: Contains the compiled Android Package files (APKs) for each extension. Filename convention: `tachiyomi-[lang].[name]-v[version].apk`.
- **`icon/`**: Contains PNG icons for each extension, named after their package identifier (e.g., `eu.kanade.tachiyomi.extension.all.ahottie.png`).
- **`index.json` / `index.min.json`**: The heart of the repo. It lists all available extensions with metadata including name, package name, version, APK filename, language, and the sources contained within.
- **`repo.json`**: Contains repository-level metadata such as the repository name, website, and the signing key fingerprint used to verify APK authenticity.

---

## 2. Extension Architecture

Extensions are essentially specialized Android apps that implement the Tachiyomi `Source` API. They are written in Kotlin.

### Core Classes:
- **`HttpSource`**: The base class for most extensions. It provides methods for making HTTP requests and handling responses.
- **`ParsedHttpSource`**: An extension of `HttpSource` specifically designed for sites that need HTML parsing. It integrates **JSoup** for CSS selector-based scraping.
- **`SManga`**, **`SChapter`**, **`Page`**: Standardized data models that the extension must populate so the main app can display content.

---

## 3. The Path to Becoming an Extension

Making an extension involves several stages, from code to distribution.

### Step 1: Development
Developers use the [extensions-source](https://github.com/keiyoushi/extensions-source) framework. Each extension is a Gradle module.
- **Dependencies**: Uses `okhttp3` for networking and `JSoup` for parsing.
- **Coding**: Implement the required methods (e.g., `popularMangaSelector()`, `chapterFromElement()`).

### Step 2: Build Process
The Gradle build system compiles the Kotlin code into a `.dex` (Dalvik Executable) file.
- The `AndroidManifest.xml` defines the extension's metadata (Name, Class, Version).
- The output is an APK file.

---

## 4. Analysis & Compilation: Understood vs Repo vs Search

| Category | My Understanding (Pre-Analysis) | Actual Findings in Repo | Precise Search Results |
|:---|:---|:---|:---|
| **File Format** | Assumed extensions were simple scripts. | They are full Android APKs with `classes.dex` and `resources.arsc`. | Confirmed: Extensions are APKs loaded dynamically by the host app via DexClassLoader. |
| **Parsing** | Expected regex or custom parsers. | Heavy reliance on `eu.kanade.tachiyomi.util.JsoupExtensionsKt`. | Documentation highlights `ParsedHttpSource` as the primary way to use CSS selectors for data extraction. |
| **Metadata** | Thought metadata might be inside the APK only. | Metadata is mirrored and extended in `index.json` for fast discovery. | Official guides explain how `build.gradle` properties are used to generate the repo's JSON. |

---

## 5. Extension Templates

To help you get started quickly, we've provided templates for the most common extension types in the `Guide/templates/` directory:

- **[ParsedHttpSource Template](./templates/ParsedHttpSourceTemplate.kt)**: Best for standard websites where you need to scrape data from HTML using CSS selectors (JSoup).
- **[HttpSource Template](./templates/HttpSourceTemplate.kt)**: Best for sources that provide data via a JSON API.
- **[SourceFactory Template](./templates/SourceFactoryTemplate.kt)**: Used when you want to bundle multiple sources (e.g., different languages for the same site) into a single extension APK.
- **[build.gradle Template](./templates/build.gradle.template)**: The basic Gradle configuration required for an extension module.
- **[ConfigurableSource Template](./templates/ConfigurableSourceTemplate.kt)**: Shows how to add a settings screen to your extension.

---

## 6. Universal Smali Template (Experimental)

For advanced users who wish to create extensions without a full Kotlin development environment (e.g., for programmatic generation via a web UI), we provide a **Universal Smali Template** in the `uni-tmpl/` directory.

### Key Parameterized Files:
- **`uni-tmpl/smali/.../Universal.smali`**: The main logic. Contains placeholders for `[[BASE_URL]]`, `[[NAME]]`, and `[[LANG]]`.
- **`uni-tmpl/smali/eu/kanade/tachiyomi/extension/BuildConfig.smali`**: Contains `[[PACKAGE_NAME]]` and `[[VERSION_NAME]]`.

### Workflow:
1. **Patch**: Search and replace the `[[PLACEHOLDERS]]` in the `.smali` files.
2. **Assemble**: Use `baksmali` to assemble the Smali files into a `classes.dex`. Note: All companion and lambda classes in the `universal` package must be included for successful assembly.
3. **Pack & Sign**: Integrate into an APK structure and sign it.

> **Note**: This method is intended for advanced patching scenarios. For standard development, using the Kotlin templates and the `extensions-source` framework is highly recommended.
