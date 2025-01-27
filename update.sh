#!/bin/bash
# update submodule
git submodule update --init --remote
# commit
if [[ $(git diff --stat) != '' ]]; then
  git config --local user.email "github-actions[bot]@users.noreply.github.com"
  git config --local user.name "github-actions[bot]"
  pushd ./dnsmasq-china-list
  make
  popd
  cp -v ./dnsmasq-china-list/*.raw.txt .
  git add .
  git commit -m "$(TZ=Asia/Shanghai date +%Y-%m-%dT%H:%M:%S%z) update"
  git push
fi
