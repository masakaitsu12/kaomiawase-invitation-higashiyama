#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

REPO_NAME="${GITHUB_PAGES_REPO_NAME:-kaomiawase-invitation-higashiyama}"

if ! gh auth status >/dev/null 2>&1; then
  echo "エラー: GitHub CLI にログインしていません。"
  echo "次を実行してから再試行してください: gh auth login"
  exit 1
fi

OWNER="$(gh api user -q .login)"
echo "GitHub ユーザー: ${OWNER}"
echo "リポジトリ名: ${REPO_NAME}"

if ! git rev-parse --git-dir >/dev/null 2>&1; then
  echo "エラー: git リポジトリではありません。git init が必要です。"
  exit 1
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  echo "GitHub 上にパブリックリポジトリを作成して push します..."
  gh repo create "${REPO_NAME}" --public --source=. --remote=origin --push \
    --description "お顔合わせのご案内（個室和食 東山 新宿本店）"
else
  echo "リモート origin があります。main を push します..."
  git push -u origin main
fi

echo "GitHub Pages を有効化します（main ブランチ・ルート）..."
set +e
gh api --method POST "repos/${OWNER}/${REPO_NAME}/pages" \
  --input - <<EOF
{
  "build_type": "legacy",
  "source": { "branch": "main", "path": "/" }
}
EOF
PAGES_EXIT=$?
set -e

if [ "$PAGES_EXIT" -ne 0 ]; then
  echo "注意: Pages API がスキップされたか、既に設定済みの可能性があります。"
  echo "GitHub の Settings → Pages で「Deploy from a branch」が main / (root) か確認してください。"
fi

echo ""
echo "公開URL:"
echo "https://${OWNER}.github.io/${REPO_NAME}/"
echo ""
echo "まだ 404 の場合は 1〜3 分待ってから再読み込みしてください。"
