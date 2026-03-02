# Universal Smali Template Checklist

Use this checklist before rebuilding unsigned APKs.

## 1) Template readiness

- [ ] `uni-tmpl/template-src/` exists and is a decoded APK tree.
- [ ] Manifest/package uses placeholders where expected.
- [ ] Smali constants for URL/selectors are placeholderized.
- [ ] Resource labels include placeholderized app/source name.

## 2) Config readiness

- [ ] `package_name` finalized (`eu.kanade.tachiyomi.extension.<lang>.<source>`).
- [ ] `version_code` / `version_name` set.
- [ ] `__EXT_BASE_URL__` and request paths set.
- [ ] selector/pattern placeholders set and tested.
- [ ] feature flags (e.g. latest enabled) set.

## 3) Patching and output

- [ ] `patch_smali_template.py` run successfully.
- [ ] replacements count > 0 and no required placeholder remains.
- [ ] smali package dir rewrite succeeded (if configured).

## 4) Build unsigned APK

- [ ] build with apktool externally or locally if available.
- [ ] resulting artifact naming matches convention:
  - `tachiyomi-<lang>.<source>-v<version>.apk`

## 5) Final validation

- [ ] install test on compatible app/fork.
- [ ] verify popular/latest/search/details/chapters/pages.
- [ ] verify extension metadata (name/version/package/lang).

