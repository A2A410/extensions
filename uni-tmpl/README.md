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

