# tech-book.nvim

これは[技術書典13](https://techbookfest.org/event/tbf13)に向けて作成したNeovimの統合環境です。

## 事前準備

### Neovimのバージョンについて

今回使うのは、本記事執筆時の `Latest` バージョンである `Nvim v0.7.2` になります。 `Neovim` が入っていない方はインストールを、バージョンが`0.7.2`未満の方はアップデートをおこなっておいてください。

`Neovim` のバージョンは以下のコマンドで確認が可能です。

```shell
nvim -v
```

### ターミナルのフォント

ご存知の通りと思いますが、NeovimはCUIエディタなので基本的に画面にはテキスト以外表示できません。したがって、様々なアイコンを文字のみで表示するために、 `Nerd Font` と呼ばれるデベロッパー向けのアイコンてんこ盛りな特殊フォントを設定していただく必要があります。

#### フォントのインストール手順

1. [https://www.nerdfonts.com/](https://www.nerdfonts.com/) にアクセスし、お好きな `Nerd Font` を見つけてダウンロード（特にこだわりがない、早く進みたいと言う人は `JetBrainsMono Nerd Font` などがおすすめです）
2. PCが使用可能な状態にする（OSなどによって異なると思うので、適宜調べていただけると助かります）
3. お使いのターミナルに先ほどダウンロードした `Nerd Font` を設定する（これもそれぞれのターミナルでやり方が異なると思うので適宜調べていただけると幸いです）

## インストール

既に `Neovim` を使っていてホームディレクトリなどに `.config/nvim` が存在する場合は、バックアップのために以下のコマンドを実行してください。

```shell
mv ~/.config/nvim ~/.config/nvim-backup
```

また同じく `Neovim` を既に使っている方の中でも、プラグインマネージャに `packer.nvim` を使っている方。その方は `packer.nvim` によってインストールされたプラグイン自体をPCから削除していただく必要がありますので以下を実行してください。

```shell
rm -rf ~/.local/nvim/site/pack
```

今度は全員、以下のコマンドを実行してください。

```shell
git clone https://github.com/eraser5th/tech-book.nvim ~/.config/nvim
```

これで準備は万端です！では `Neovim` を起動しましょう！

```shell
nvim
```
