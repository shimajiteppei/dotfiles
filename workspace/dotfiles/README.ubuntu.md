# PC初期構築時のチェックリスト

## OSインストール

- [ ] クリーンインストール（前バージョンのデータはパーティションを切って退避する）
- [ ] システム言語 英語
- [ ] タイムゾーン 日本

## システム設定

- [ ] 電源設定
- [ ] ディスプレイ設定
- [ ] gnome extension manager
    - [ ] quick lang switch
    - [ ] Hide top bar
    - [ ] No title bar when maximized
- [ ] USキーボードでの日本語入力設定
    - [ ] mozc
    - [ ] xremap
        - [ ] `systemctl --user enable --now xremap`
        - [ ] capslock -> ctrl
        - [ ] ctrl -> F13
    - [ ] 入力ソース変更ショートカットをF13に設定
- [ ] フォント設定
    - [ ] UDEV Gothic https://github.com/yuru7/udev-gothic のインストール
    - [ ] gnome tweaks
        - [ ] システムフォントの変更

## アプリケーション

- [ ] ブラウザ
    - [ ] ブックマークの引き継ぎ
    - [ ] 全画面共有が正常動作することを確認
- [ ] guake
    - [ ] `guake --restore-preferences .config/guake/config`
    - [ ] システム設定で`guake-toggle`をAlt+Zに割り当てる
    - [ ] 無限スクロール
    - [ ] 透明度
    - [ ] startup application
- [ ] VSCode
    - [ ] アカウント・設定同期
- [ ] Jetbrains toolbox
    - [ ] アカウント・設定同期
- [ ] Multipass
- [ ] Docker
- [ ] SSH鍵引き継ぎ
- [ ] Zsh
    - [ ] dotfiles展開
- [ ] 各種言語
    - [ ] SDKMAN
    - [ ] Rustup, Cargo
    - [ ] Volta
    - [ ] uv