#!/usr/bin/env python3
"""Patch a decoded Smali template using placeholder mappings.

- Copies template tree to output directory
- Applies token replacements across text files
- Optionally rewrites package directory paths in smali* trees
"""

from __future__ import annotations

import argparse
import json
import shutil
from pathlib import Path

TEXT_SUFFIXES = {
    ".smali",
    ".xml",
    ".yml",
    ".yaml",
    ".txt",
    ".properties",
    ".json",
    ".md",
    ".gradle",
}
TEXT_NAMES = {"AndroidManifest.xml", "apktool.yml"}


def is_text_file(path: Path) -> bool:
    if path.name in TEXT_NAMES:
        return True
    return path.suffix.lower() in TEXT_SUFFIXES


def load_config(path: Path) -> dict:
    data = json.loads(path.read_text(encoding="utf-8"))
    if "placeholders" not in data or not isinstance(data["placeholders"], dict):
        raise ValueError("Config must include a 'placeholders' object")
    return data


def replace_in_tree(root: Path, mapping: dict[str, str]) -> tuple[int, int]:
    files_changed = 0
    replacements = 0
    for p in root.rglob("*"):
        if not p.is_file() or not is_text_file(p):
            continue
        try:
            text = p.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            continue

        original = text
        for src, dst in mapping.items():
            count = text.count(src)
            if count:
                text = text.replace(src, dst)
                replacements += count

        if text != original:
            p.write_text(text, encoding="utf-8")
            files_changed += 1
    return files_changed, replacements


def rewrite_smali_package_dirs(root: Path, from_pkg: str, to_pkg: str) -> list[tuple[Path, Path]]:
    moved = []
    from_rel = Path(*from_pkg.split("."))
    to_rel = Path(*to_pkg.split("."))

    for smali_root in sorted([p for p in root.iterdir() if p.is_dir() and p.name.startswith("smali")]):
        src = smali_root / from_rel
        if not src.exists():
            continue
        dst = smali_root / to_rel
        dst.parent.mkdir(parents=True, exist_ok=True)
        if dst.exists():
            raise FileExistsError(f"Destination already exists: {dst}")
        shutil.move(str(src), str(dst))
        moved.append((src, dst))
    return moved


def main() -> int:
    parser = argparse.ArgumentParser(description="Patch decoded Smali template with placeholders")
    parser.add_argument("--template", required=True, type=Path, help="Decoded template directory")
    parser.add_argument("--config", required=True, type=Path, help="JSON patch configuration")
    parser.add_argument("--out", required=True, type=Path, help="Output patched directory")
    parser.add_argument("--in-place", action="store_true", help="Patch template directory directly")
    args = parser.parse_args()

    if not args.template.exists():
        raise SystemExit(f"Template directory not found: {args.template}")

    config = load_config(args.config)

    if args.in_place:
        target = args.template
    else:
        if args.out.exists():
            shutil.rmtree(args.out)
        shutil.copytree(args.template, args.out)
        target = args.out

    mapping = {k: str(v) for k, v in config["placeholders"].items()}

    files_changed, replacements = replace_in_tree(target, mapping)

    moved = []
    from_pkg = config.get("smali_package_from")
    to_pkg = config.get("smali_package_to")
    if from_pkg and to_pkg:
        moved = rewrite_smali_package_dirs(target, from_pkg, to_pkg)

    print(f"patched_dir={target}")
    print(f"files_changed={files_changed}")
    print(f"replacements={replacements}")
    if moved:
        print("moved_package_dirs=")
        for src, dst in moved:
            print(f"  - {src} -> {dst}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
