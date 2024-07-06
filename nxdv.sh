#!/usr/bin/env bash

nxdv() {
  if [ $# -eq 0 ]; then
    echo "Usage: nxdv <directory1> <directory2> ... <directoryN> -- <args>"
    return 1
  fi

  dirs=()
  extra_args=()
  args_after=false

  for arg in "$@"; do
    if $args_after; then
      extra_args+=("$arg")
    elif [ "$arg" == "--" ]; then
      args_after=true
    else
      dirs+=("$arg")
    fi
  done

  if [ ${#dirs[@]} -eq 0 ]; then
    echo "Usage: nxdv <directory1> <directory2> ... <directoryN> -- <args>"
    return 1
  fi

  for dir in "${dirs[@]}"; do
    nix develop github:kanielrkirby/nxdv?dir="$dir" "${extra_args[@]}"
  done
}

nxdv "$@"
