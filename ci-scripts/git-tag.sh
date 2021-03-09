#!/bin/bash

# Commit back to the repository
# version number, push the tag back to the remote.

set -ex

# Tag and push
tag=$(semversioner current-version)

# Tag
git tag -a -m "Tagging for release ${tag}" "${tag}"
git push origin ${tag}