#!/usr/bin/env bash
# 把说明书发布到 GitHub Pages（需先 gh auth login）
# 用法: bash deploy-gh.sh
set -e
REPO="ppt-skills-manual"
REMOTE="https://github.com/$(gh api user --jq .login)/$REPO.git"

cd "$(dirname "$0")"

git init -q 2>/dev/null || true
git add -A
git commit -q -m "feat: PPT Skills 图鉴使用说明书" || echo "nothing to commit"

# 建仓库（若不存在）
gh repo view "$REPO" >/dev/null 2>&1 || gh repo create "$REPO" --public --source=. --remote=origin --push

git remote set-url origin "$REMOTE" 2>/dev/null || git remote add origin "$REMOTE"
git branch -M main
git push -u origin main

gh repo edit "$REPO" --visibility public
# 开启 Pages（从 main 分支根目录）
gh api repos/$(gh api user --jq .login)/$REPO/pages --method POST \
  -f source='{"branch":"main","path":"/"}' >/dev/null 2>&1 || \
  gh api repos/$(gh api user --jq .login)/$REPO/pages -X PUT \
  -f source='{"branch":"main","path":"/"}' >/dev/null 2>&1 || true

echo "已推送。GitHub Pages 地址：https://$(gh api user --jq .login).github.io/$REPO/"
