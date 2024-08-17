# jasnaoe_template_typst

このテンプレートは，2024年秋季以降の日本船舶海洋工学会の講演会論文作成を想定して，
[Typst](https://typst.app)で作成しています．

もちろん♡非公式♡のテンプレートですので，ご使用の際は自己責任でお願いします．

このテンプレートを使ったPDFファイルの仕上がりは，[GitHub PagesのPDFファイル](https://taiga4112.github.io/jasnaoe_template_typst/main.pdf)をご確認ください．

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
各自のPCにインストールされているフォントと照らし合わせて，前の方から優先的に使われるようです．

```ts
#let gothic = ("MS Gothic", "IPAexGothic", "Noto Sans CJK JP", "Hiragino Kaku Gothic Pro")
#let mincho = ("MS Mincho", "IPAexMincho", "Noto Serif CJK JP", "Hiragino Mincho Pro")
#let english = ("Times New Roman", "New Computer Modern")
```

基本的には，前の方がおすすめなフォントですが，

- ゴシック: MS GothicとIPAexGothic
- 明朝: MS MinchoとIAPexMincho
- 英語: Times New Roman

くらいまででないと，仕上がりが指定フォーマットに近づきません．

Typstで認識されているフォントを確認するには，以下のコマンドを実行すると良いです．

```bash
typst fonts
```

#### Windows

おそらく，WindowsではMS GothicとMS Mincho，Times New Romanがデフォルトで入っているので，何もする必要がありません．

#### Mac OS

おそらく，MacではTimes New Romanは入っているけども，ゴシックや明朝はフォントをインストールする必要があります．

IPAexフォントであれば，[Homebrew](https://formulae.brew.sh/)を利用して簡単にインストールできます．

```bash
brew install --cask font-ipaexfont
```

MSフォントは，Microsoft OfficeがインストールされているPCであれば[この記事](https://note.com/tomorrow311/n/ne835a8c525a9)の方法で取り込めそうですが，ご自身の責任でお願いします．

#### Linux

IPAexフォントは以下の方法でインストールできそうです．

```bash
# Debian系(Ubuntu)
sudo apt-get install fonts-ipaexfont fonts-ipafont-mincho fonts-ipafont-gothic
```

## 使用方法

### 1. ファイルを準備する

- GitHubアカウントを持っている方は，`use this template` で．自分用のレポジトリを生成してください

- GitHubアカウントを持っていない方は，このGitHubページの `<>Code▼` から `Download ZIP` し，　ZIPファイルを解凍して使用してください．

### 2. 編集&コンパイルでpdfを作成する

編集するファイルはmain.typです．

#### Visual Studio Code (VSCode) を使用する場合

1. VSCode で `File`→`Open Folder` でこのフォルダーを開く．

2. 拡張機能をインストール．  
    - [Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)
    - 何でも良いのでpdfをVSCodeで閲覧できる拡張機能．例えば，[vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf)など．

3. [Typst LSP](https://marketplace.visualstudio.com/items?itemName=nvarner.typst-lsp)のデフォルトの設定では，typファイルを保存すると，問題がなければコンパイル後にpdfファイルが同じ階層に生成されます．
    - 問題があったときにわかりやすいように，PROBLEMS(日本語で「問題」)を常に表示させておくと良いかと思います．
        - Macだと command + shift + m ．

#### コンソールでコンパイルをする場合

[公式サイト](https://github.com/typst/typst?tab=readme-ov-file#usage)を参照ください．
