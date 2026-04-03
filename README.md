# お顔合わせのご案内（静的LP）

GitHub Pages 用の静的LPです。トップURLは `index.html`、同一内容の別名ファイルは `invitation_higashiyama.html`（`/invitation_higashiyama.html` でも開けます）。

## 公開手順（初回）

1. ターミナルで GitHub CLI にログインする  
   `gh auth login`  
   （ブラウザ認証で問題ありません）

2. このフォルダで次を実行する  
   `bash publish_github_pages.sh`

3. スクリプトが表示する `https://<ユーザー名>.github.io/<リポジトリ名>/` を開く（反映まで1〜3分かかることがあります）

## HTML の更新

`index.html`（および同内容の `invitation_higashiyama.html`）を編集後:

```bash
git add index.html invitation_higashiyama.html
git commit -m "Update invitation page"
git push
```

数分後にサイトへ反映されます。
