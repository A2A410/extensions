# Analysis Methodology

This analysis was done directly against all APK artifacts in `apk/` using local tooling only.

## Core steps

1. Enumerated repository structure and APK corpus size.
2. Parsed APK naming to derive language/source/version taxonomy.
3. Inspected ZIP internals of all APKs (`classes.dex`, manifest/resources/signature/i18n files).
4. Scanned dex bytes for package/class fingerprints and multisrc family indicators.
5. Verified icon/APK identity parity by filename mapping.
6. Sampled signing certificate metadata with `keytool`.

## Important environment limitation

Attempts to access external documentation from GitHub (and to install extra reverse-engineering packages) were blocked by proxy `403 CONNECT` responses, so this guide emphasizes repository-grounded evidence.

