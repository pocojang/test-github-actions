#!/usr/bin/env bash

# 패키지 버전
VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

TAG="v.$VERSION"

echo "===== please check the git push origin of remote ====="
echo "===== Create a Git Tag '$TAG' ====="

eval "git tag $TAG"
eval "git push origin $TAG"
