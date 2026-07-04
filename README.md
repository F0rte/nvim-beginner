# Vim初心者向けプラグイン

## 動作確認方法（普段使いの設定を壊さずにテストする）

Neovimは`~/.config/nvim`（または`NVIM_APPNAME`で指定したディレクトリ）しか設定として読み込まない。
普段使いの本番設定（`~/.config/nvim`）を上書きせずにこのリポジトリの内容を試すには、`NVIM_APPNAME`でテスト用の別名設定として起動する。

1. テスト用のシンボリックリンクを作成する（初回のみ）

   ```sh
   ln -s /path/to/this-repo ~/.config/vim-beginner-dev
   ```

2. テスト用の設定でNeovimを起動する

   ```sh
   NVIM_APPNAME=vim-beginner-dev nvim
   ```

これで普段の`~/.config/nvim`には一切手を加えず、このリポジトリの設定だけを読み込んだ状態でNeovimを起動できる。

