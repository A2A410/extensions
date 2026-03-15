import os
import json
import shutil
import argparse

def patch_file(filepath, placeholders):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    for key, value in placeholders.items():
        content = content.replace(key, str(value))

    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--tmpl', required=True, help='Path to decoded template root')
    parser.add_argument('--config', required=True, help='Path to config.json')
    parser.add_argument('--out', required=True, help='Path to output workdir')
    args = parser.parse_args()

    with open(args.config, 'r') as f:
        config = json.load(f)

    if os.path.exists(args.out):
        shutil.rmtree(args.out)
    shutil.copytree(args.tmpl, args.out)

    placeholders = config.get('placeholders', {})

    # Global replacement
    for root, dirs, files in os.walk(args.out):
        for file in files:
            if file.endswith('.smali') or file.endswith('.xml') or file.endswith('.yml'):
                patch_file(os.path.join(root, file), placeholders)

    # Handle Smali package move
    src_pkg = config.get('smali_package_from', 'eu.kanade.tachiyomi.extension.all.universal')
    dst_pkg = config.get('smali_package_to')

    if dst_pkg and src_pkg != dst_pkg:
        src_path = os.path.join(args.out, 'smali', *src_pkg.split('.'))
        dst_path = os.path.join(args.out, 'smali', *dst_pkg.split('.'))

        if os.path.exists(src_path):
            os.makedirs(os.path.dirname(dst_path), exist_ok=True)
            shutil.move(src_path, dst_path)

            # Update class references in all smali files
            src_ref = src_pkg.replace('.', '/')
            dst_ref = dst_pkg.replace('.', '/')
            for root, dirs, files in os.walk(args.out):
                for file in files:
                    if file.endswith('.smali'):
                        patch_file(os.path.join(root, file), {src_ref: dst_ref})

    print(f"Patched template created at {args.out}")

if __name__ == "__main__":
    main()
