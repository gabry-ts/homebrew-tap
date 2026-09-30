#!/usr/bin/env bash
# Bumps every cask in Casks/*.rb to its repo's latest GitHub release.
# For each cask that is out of date: downloads the new dmg, computes its
# sha256, and rewrites the `version` and `sha256` lines in place.
set -euo pipefail

api_headers=(-H "Accept: application/vnd.github+json")
if [ -n "${GH_TOKEN:-}" ]; then
  api_headers+=(-H "Authorization: Bearer ${GH_TOKEN}")
elif [ -n "${GITHUB_TOKEN:-}" ]; then
  api_headers+=(-H "Authorization: Bearer ${GITHUB_TOKEN}")
fi

changed=0

for cask in Casks/*.rb; do
  name=$(basename "$cask" .rb)

  repo=$(sed -n -E 's/.*url "https:\/\/github\.com\/([^\/]+\/[^\/]+)\/releases\/download\/.*/\1/p' "$cask" | head -n1)
  if [ -z "$repo" ]; then
    echo "skip $name: could not find github repo in url"
    continue
  fi

  current_version=$(sed -n -E 's/^[[:space:]]*version "([^"]+)"/\1/p' "$cask" | head -n1)

  # A repo with no release yet is skipped instead of stopping every other cask.
  if ! latest_json=$(curl -fsSL "${api_headers[@]}" "https://api.github.com/repos/${repo}/releases/latest"); then
    echo "skip $name: no release found for ${repo}"
    continue
  fi
  latest_tag=$(echo "$latest_json" | jq -r '.tag_name')
  latest_version=${latest_tag#v}

  if [ "$latest_version" = "$current_version" ]; then
    echo "$name: up to date ($current_version)"
    continue
  fi

  dmg_url=$(echo "$latest_json" | jq -r '.assets[] | select(.name | test("\\.dmg$")) | .browser_download_url' | head -n1)
  if [ -z "$dmg_url" ] || [ "$dmg_url" = "null" ]; then
    echo "skip $name: no dmg asset for $latest_tag"
    continue
  fi

  tmp_dmg=$(mktemp)
  curl -fsSL "$dmg_url" -o "$tmp_dmg"
  new_sha256=$(shasum -a 256 "$tmp_dmg" | awk '{print $1}')
  rm -f "$tmp_dmg"

  sed -i.bak -E "s/^([[:space:]]*version )\"[^\"]+\"/\1\"${latest_version}\"/" "$cask"
  sed -i.bak -E "s/^([[:space:]]*sha256 )\"[^\"]+\"/\1\"${new_sha256}\"/" "$cask"
  rm -f "${cask}.bak"

  echo "$name: bumped $current_version -> $latest_version"
  changed=1
done

if [ "$changed" -eq 1 ]; then
  echo "bump-casks: casks updated"
else
  echo "bump-casks: no changes"
fi
