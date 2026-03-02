# CODEX_ADDED_NEXTTIME_NOTES (Smali/Apktool-focused)

> Marker: `CODEX_ADDED_*` means this file/field was intentionally added by Codex for next-round decompile patch workflow.

## Why Smali-first

- Android-native development on-device is difficult.
- This seed app stores technical configuration in assets/DEX so you can:
  1) build once,
  2) decompile with apktool,
  3) patch tokens/config in Smali/text,
  4) rebuild unsigned APK.

## Required vs Optional (next patch round)

### Required (minimum viable patch set)
- `mode` (`html` or `api`)
- `profile` (`madara` / `mangathemesia` / `parsed` / `api`)
- `__EXT_PKG__`
- `__EXT_NAME__`
- `__EXT_LANG__`
- `__EXT_SOURCE_ID__`
- `__EXT_BASE_URL__`
- `__EXT_POPULAR_PATH__`
- `__EXT_SEARCH_PATH__`
- `__EXT_CHAPTER_SELECTOR__` (or `chapter_key_path` for API)
- `__EXT_PAGE_SELECTOR__` (or `page_key_path` for API)

### Optional (safe to leave default at first)
- `__EXT_LATEST_PATH__`
- `__EXT_ENABLE_LATEST__`
- detail selectors (`details_*`)
- `next_page_selector`
- feature flags except `json_api_mode`

### Optional removable once runtime wiring exists
- informational notes/docs in assets
- examples in `super_template_spec.json`
- any `CODEX_ADDED_*` helper metadata not consumed by your patcher

## Decompile-time hints (apktool)

When decompiled, look for:
- `assets/super_template_spec.json`
- `assets/CODEX_ADDED_NEXTTIME_NOTES.md`
- class/object name: `SuperTemplatePlaceholders`
- strings prefixed with token names like `__EXT_*__`
- marker keys prefixed with `CODEX_ADDED_`

## Recommended lifecycle

1. Build seed APK from `super-app-source`.
2. Decompile with apktool on-device/app.
3. Patch required tokens first.
4. Rebuild unsigned APK and smoke test.
5. Only then patch optional selectors/features.

