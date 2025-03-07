# jasnaoe_template_typst

このテンプレートは，2024年秋季以降の日本船舶海洋工学会の講演会論文作成を想定して，[Typst](https://typst.app)で作成しています．

もちろん♡非公式♡のテンプレートですので，ご使用の際は自己責任でお願いします．

このテンプレートを使ったPDFファイルの仕上がりは，[GitHub PagesのPDFファイル](https://taiga4112.github.io/jasnaoe_template_typst/main.pdf)をご確認ください．

> **注意**
>
> 2024年秋季講演会から[講演論文のテンプレートが大幅に変更]("https://www.jasnaoe.or.jp/lecture/2024aut/thesis.html?id=yoryo")されました．
>
> 具体的には，論文タイトル，著者情報，キーワード，要旨は講演論文投稿システムで別に作成し，本文のみを記載したファイルを講演論文投稿システムに投稿することで，システム側でマージして完成するようになりました．
>
> そのため，このテンプレートは，2024年秋季講演会から変更されたフォーマットに沿って，本文情報のみを記載することを想定しています。論文タイトル，著者情報，キーワード，要旨はこのテンプレートでは記載することを想定していません．

## 事前準備

### Typstのインストール

公式のマニュアルは[こちら](https://github.com/typst/typst?tab=readme-ov-file#installation)．

Windowsの場合は，PowerShellか何かで，以下のコマンドを実行してください．

```bash
winget install --id Typst.Typst
```

Mac OSの場合は，Terminalか何かで，[Homebrew](https://formulae.brew.sh/)を使って，以下のコマンドを実行してください．

```bash
brew install typst
```

### フォントのインストール(Mac, Linuxのみ)

現在，フォントについては以下の設定になっています．
各自のPCにインストールされているフォントと照らし合わせて，前の方から優先的に使われます．

```ts
#let mincho = ("TeX Gyre Termes", "IPAMincho")
#let gothic = ("TeX Gyre Termes", "IPAGothic")
// #let mincho = ("Times New Roman", "IPAMincho")
// #let gothic = ("Times New Roman", "IPAGothic")
// #let mincho = ("Times New Roman", "MS Mincho", "IPAMincho")
// #let gothic = ("Times New Roman", "MS Gothic", "IPAGothic")
```

基本的には，英語の場合に優先的に選択されるTeX Gyre Termes，日本語の場合はIPAフォントが使われるように設定しています．
[指定フォーマット](https://www.jasnaoe.or.jp/lecture/2024aut/thesis.html?id=yoryo)は英語はTimes New Romanフォント、日本語はMSフォントを使っています．
必要に応じて、コメントアウトしているMSフォントを指定すると良いです。

Typstで認識されているフォントを確認するには，以下のコマンドを実行すると良いです．

```bash
typst fonts
```

#### Windows

Tex Gyre Termsフォントのダウンロードは[ここ](https://www.1001fonts.com/tex-gyre-termes-font.html)からできそうです．

IPAフォントのダウンロードと新しいフォントのインストールは[ここ](https://www.kisnet.or.jp/~kanou/index.php?windows/windows%E5%85%B1%E9%80%9A/IPAFont%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB)あたりを参考にしてください．
フォントの設定を以下のように変えて、Windowsに搭載されているフォントを使うのも良いかもしれません．

```ts
// #let mincho = ("TeX Gyre Termes", "IPAMincho")
// #let gothic = ("TeX Gyre Termes", "IPAGothic")
// #let mincho = ("Times New Roman", "IPAMincho")
// #let gothic = ("Times New Roman", "IPAGothic")
#let mincho = ("Times New Roman", "MS Mincho", "IPAMincho")
#let gothic = ("Times New Roman", "MS Gothic", "IPAGothic")
```

#### Mac OS

おそらく，MacではTimes New Romanは入っているけども，ゴシックや明朝はフォントをインストールする必要があります．

IPAフォントであれば，[Homebrew](https://formulae.brew.sh/)を利用して簡単にインストールできます．

```bash
brew install --cask font-tex-gyre-termes
brew install --cask font-ipafont
```

Times New RomanフォントやMSフォントを使用する場合は，Microsoft OfficeがインストールされているPCであれば[この記事](https://note.com/tomorrow311/n/ne835a8c525a9)の方法で取り込めそうですが，ご自身の責任でお願いします．

#### Linux

IPAフォントは以下の方法でインストールできそうです．

```bash
# Debian系(Ubuntu)
sudo apt install tex-gyre
sudo apt-get install fonts-ipafont
```

## 使用方法

### 1. ファイルを準備する

- GitHubアカウントを持っている方は，`use this template` で．自分用のレポジトリを生成してください

- GitHubアカウントを持っていない方は，このGitHubページの `<>Code▼` から `Download ZIP` し，ZIPファイルを解凍して使用してください．

### 2. 編集&コンパイルでpdfを作成する

編集するファイルはmain.typです．

#### コンソールでコンパイルをする場合 (推奨)

以下のコマンドを実行することでファイルの変更時に自動でコンパイルを行ってpdfファイルを生成してくれます。コンパイルが失敗する場合はエラーメッセージが表示されるので、該当の場所を修正しましょう。

```sh
typst watch main.typ main.pdf
```

詳しくは、[公式サイト](https://github.com/typst/typst?tab=readme-ov-file#usage)を参照ください．
