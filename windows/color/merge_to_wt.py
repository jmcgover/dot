#!/usr/bin/env python3

import sys
import os

import json
import argparse
import pathlib


DESCRIPTION = """
Merges the supplied json files with the appearances portion of Windows Terminal
settings json.
"""


def get_arg_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog=sys.argv[0], description=DESCRIPTION)
    parser.add_argument(
        "settings_path",
        type=pathlib.Path,
        help="path to Windows Terminal settings JSON file",
    )
    parser.add_argument(
        "color_scheme_paths",
        nargs="*",
        type=str,
        help="paths to Windows Terminal color scheme JSON files",
    )
    return parser


def main() -> int:
    # Parse Arguments
    parser: argparse.ArgumentParser = get_arg_parser()
    args: argparse.Namespace = parser.parse_args()

    # Get Args
    settings_path: pathlib.Path = args.settings_path
    color_scheme_paths: list[pathlib.Path] = args.color_scheme_paths

    # Expand into Paths
    settings_path: pathlib.Path = pathlib.Path(os.path.expandvars(settings_path))
    color_scheme_paths: list[pathlib.Path] = [
        pathlib.Path(os.path.expandvars(path)) for path in color_scheme_paths
    ]

    # Open existing settings
    with open(settings_path) as file:
        settings: dict[str, Any] = json.load(file)

    all_schemes: dict[str, Any] = {}

    # Save existing schemes
    for scheme in settings["schemes"]:
        all_schemes[scheme["name"]] = scheme

    # Open and save new color schemes
    for cs_path in color_scheme_paths:
        with open(cs_path) as file:
            color_scheme: dict[str, Any] = json.load(file)
        all_schemes[color_scheme["name"]] = color_scheme

    # Output JSON
    print(
        json.dumps(
            {"schemes": [all_schemes[key] for key in sorted(all_schemes)]},
            indent=2,
            sort_keys=True,
        )
    )

    return 0


if __name__ == "__main__":
    sys.exit(main())
