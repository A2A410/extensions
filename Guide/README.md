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

### How it works:
When a user adds `https://raw.githubusercontent.com/keiyoushi/extensions/repo/index.min.json` to their app, the app:
1. Fetches `index.min.json`.
2. Compares the versions of installed extensions with those in the JSON.
3. Downloads the APK from the `apk/` directory if an update is found or a new extension is selected.

---

## 2. Extension Architecture

Extensions are essentially specialized Android apps that implement the Tachiyomi `Source` API. They are written in Kotlin.

### Core Classes (Found in analyzed APKs):
- **`HttpSource`**: The base class for most extensions. It provides methods for making HTTP requests and handling responses.
- **`ParsedHttpSource`**: An extension of `HttpSource` specifically designed for sites that need HTML parsing. It integrates **JSoup** for CSS selector-based scraping.
- **`SManga`**, **`SChapter`**, **`Page`**: Standardized data models that the extension must populate so the main app can display content.

### Extension Lifecycle/Functions:
1. **Popular/Latest Manga**: Fetches a list of manga from the source's main or latest updates page.
2. **Search**: Handles user queries, often including filters (Genres, Status, etc.).
3. **Manga Details**: Fetches metadata (Description, Artist, Genres) for a specific manga.
4. **Chapter List**: Extracts the list of chapters for a manga.
5. **Page List**: Retrieves the URLs of images for a specific chapter.
6. **Image Request**: Handles the actual fetching of the image file, sometimes requiring custom headers (Referer, User-Agent).

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

### Step 3: Signing
For an app to accept an extension, it must be signed. This repo uses a specific signing key (fingerprint: `9add...`) to ensure all APKs are from a trusted source.

---

## 4. Analysis & Compilation: Understood vs Repo vs Search

| Category | My Understanding (Pre-Analysis) | Actual Findings in Repo | Precise Search Results |
|:---|:---|:---|:---|
| **File Format** | Assumed extensions were simple scripts. | They are full Android APKs with `classes.dex` and `resources.arsc`. | Confirmed: Extensions are APKs loaded dynamically by the host app via DexClassLoader. |
| **Parsing** | Expected regex or custom parsers. | Heavy reliance on `eu.kanade.tachiyomi.util.JsoupExtensionsKt`. | Documentation highlights `ParsedHttpSource` as the primary way to use CSS selectors for data extraction. |
| **Metadata** | Thought metadata might be inside the APK only. | Metadata is mirrored and extended in `index.json` for fast discovery. | Official guides explain how `build.gradle` properties are used to generate the repo's JSON. |
| **Networking** | Standard Java/Android networking. | Use of `okhttp3` with custom `NetworkHelper` for interceptors (Cloudflare bypass). | Search revealed advanced techniques like `RateLimitInterceptor` used to prevent IP bans. |

---

## 5. How to Create an Extension: Step-by-Step

1. **Setup**: Clone the `extensions-source` repository.
2. **Create Module**: Use the provided Gradle tasks to create a new module for your target site (e.g., `en.mysource`).
3. **Configure `build.gradle`**:
   - `extName`: Display name.
   - `pkgNameSuffix`: Unique ID.
   - `extClass`: Path to your main Kotlin class.
4. **Implement Class**:
   - Inherit from `ParsedHttpSource` if the site is HTML-based.
   - Define `baseUrl`.
   - Implement the scraping logic using JSoup selectors.
5. **Add Icon**: Place a `logo.png` in the `res` folder.
6. **Test**: Run the extension on an Android device with Mihon installed.
7. **Build**: Use `./gradlew assembleRelease` to generate the APK.
8. **Distribute**: Add the APK and its metadata to an `index.json` like the one in this repo.

---

## 6. Extension Templates

To help you get started quickly, we've provided templates for the most common extension types in the `Guide/templates/` directory:

- **[ParsedHttpSource Template](./templates/ParsedHttpSourceTemplate.kt)**: Best for standard websites where you need to scrape data from HTML using CSS selectors (JSoup).
- **[HttpSource Template](./templates/HttpSourceTemplate.kt)**: Best for sources that provide data via a JSON API.
- **[SourceFactory Template](./templates/SourceFactoryTemplate.kt)**: Used when you want to bundle multiple sources (e.g., different languages for the same site) into a single extension APK.
- **[build.gradle Template](./templates/build.gradle.template)**: The basic Gradle configuration required for an extension module.
- **[ConfigurableSource Template](./templates/ConfigurableSourceTemplate.kt)**: Shows how to add a settings screen to your extension (e.g., for choosing image quality).

### How to use:
1. Choose the template that fits your target site.
2. Copy the content into your new module's main class.
3. Replace the placeholder URLs and selectors with the actual values for your site.
4. Update the package name and class name to match your module structure.
