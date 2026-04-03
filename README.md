# お顔合わせのご案内（静的LP）

GitHub Pages 用の静的LPです。トップURLは `index.html`、同一内容の別名ファイルは `invitation_higashiyama.html`（`/invitation_higashiyama.html` でも開けます）。

## 現在の公開URL（ユーザー名: masa36230）

- トップ: `https://masa36230.github.io/kaomiawase-invitation-higashiyama/`
- 別名: `https://masa36230.github.io/kaomiawase-invitation-higashiyama/invitation_higashiyama.html`
- リポジトリ: `https://github.com/masa36230/kaomiawase-invitation-higashiyama`

※ 旧ユーザー名のURLからは、しばらくリダイレクトされることがあります。**共有・印刷するリンクは上記の新URLに統一**してください。

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

## Pages の URL とユーザー名について

GitHub Pages のユーザー向けURLは次の形で、**先頭は GitHub アカウントのログイン名**です。

`https://<GitHubユーザー名>.github.io/<リポジトリ名>/`

- ユーザー名を変えたあと、**このフォルダの `git remote`** を新しいURLに合わせると安全です（例: `git remote set-url origin https://github.com/masa36230/kaomiawase-invitation-higashiyama.git`）。
- ユーザー名をURLに出したくない場合は、**独自ドメイン**（Pages の Custom domain）の利用も検討できます。

エージェント側からアカウント名の変更は実行できないため、変更は GitHub の画面で実施してください。
