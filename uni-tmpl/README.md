# uni-tmpl: Smali-first Universal Extension Template

This directory defines a **reverse-engineered, Smali patch workflow** for generating a configurable, unsigned extension APK.

## Goal

Given a decompiled extension template (Smali project), patch placeholders for:

- package name
- app/extension display name
- versionCode / versionName
- base URL
- search/listing paths
- selectors/patterns
- language/source identifiers
- feature flags/settings defaults

Then rebuild into an **unsigned APK**.

---

## Expected input template

Place a decoded APK project under:

- `uni-tmpl/template-src/`

Expected typical structure:

- `AndroidManifest.xml`
- `smali*/...` (smali classes)
- `res/values/strings.xml`
- `assets/i18n/messages_*.properties` (optional)
- `apktool.yml` (if decoded by apktool)

> If you do not have `template-src/` yet, decode an existing APK externally with `apktool d <apk> -o uni-tmpl/template-src`.

---

## Placeholder contract

Inside `template-src/`, use stable placeholders such as:

- `__EXT_PKG__`
- `__EXT_NAME__`
- `__EXT_VERSION_CODE__`
- `__EXT_VERSION_NAME__`
- `__EXT_LANG__`
- `__EXT_SOURCE_ID__`
- `__EXT_BASE_URL__`
- `__EXT_POPULAR_PATH__`
- `__EXT_LATEST_PATH__`
- `__EXT_SEARCH_PATH__`
- `__EXT_CHAPTER_SELECTOR__`
- `__EXT_PAGE_SELECTOR__`
- `__EXT_ENABLE_LATEST__`

Use these in manifest/smali/resources wherever needed.

---


## Local HTML builder

A no-backend local UI is available at:

- `uni-tmpl/local-builder.html`

Open it directly in your browser, fill fields, then export `patch-config.json` and run the generated command.

## Patch config

Create your config JSON from `examples/patch-config.example.json` and run:

```bash
python uni-tmpl/scripts/patch_smali_template.py \
  --template uni-tmpl/template-src \
  --config uni-tmpl/examples/patch-config.example.json \
  --out uni-tmpl/build/workdir
```

This produces a patched Smali project in `uni-tmpl/build/workdir`.

---

## Build unsigned APK

If `apktool` is available in your environment:

```bash
apktool b uni-tmpl/build/workdir -o uni-tmpl/build/extension-unsigned.apk
```

If not available, move the patched folder to a machine with apktool and build there.

---

## Package-path rewrite support

If you set `package_name`, the patcher can also remap package folder paths in Smali:

- from `smali*/eu/kanade/tachiyomi/extension/template/...`
- to `smali*/<your/package/path>/...`

This helps align class descriptors with your desired package identity.

---

## Notes

- This workflow stays **unsigned** by design.
- Replacing placeholders in Smali is textual; keep placeholder tokens unique.
- For robust long-term maintenance, keep business logic in template classes and only patch constants/selectors.



## Super template seed app source

For your "bake technical info into APK first" workflow, a minimal compile-safe seed app source is included:

- `uni-tmpl/super-app-source/`
- includes `assets/super_template_spec.json` (mode/profile/flags/URL+selector requirements)
- includes `SuperTemplatePlaceholders.kt` with mode/profile/tokens/feature placeholders baked into DEX

Mode model used there:
- **2 top-level modes**: `html`, `api`
- **4 profiles** under modes: `madara`, `mangathemesia`, `parsed`, `api`

This is intentionally not runtime-ready extension logic yet; it is a technical seed for decompile-and-patch rounds.



## Important next-time instructions (Smali/apktool)

For your on-device apktool workflow, key markers and guidance are now baked in:

- `assets/CODEX_ADDED_NEXTTIME_NOTES.md`
- `assets/super_template_spec.json` with `CODEX_ADDED_*` marker fields
- `SuperTemplatePlaceholders.CODEX_ADDED_MARKER` in DEX constants

What to patch first vs later is explicitly documented in those asset files.

