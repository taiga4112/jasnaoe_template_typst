// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

// Set the Fonts
#let gothic = ("MS Gothic", "Hiragino Kaku Gothic Pro", "IPAexGothic", "Noto Sans CJK JP")
#let mincho = ("MS Mincho", "Hiragino Mincho Pro", "IPAexMincho", "Noto Serif CJK JP")
#let english = ("Times New Roman", "New Computer Modern")

#let jasnaoe-conf(
  title: none,
  authors: none,
  abstract: none,
  bibliography: none,
  body
) = {

  // Configure the page.
  set page(
    paper: "a4",
    margin: (top: 25mm, bottom: 22mm, x: 17mm)
  )

  set text(size: 9pt, font: english)
  show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: mincho)
  show "．": set text(font: mincho) // 全角ピリオドのときだけ明朝体に変更
  show "，": set text(font: mincho) // 全角カンマのときだけ明朝体に変更
  set par(leading: 1.00em, first-line-indent: 1.00em, justify: true)
  show par: set block(spacing: 1.00em)

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)", supplement: [Eq.])
  show math.equation: set block(spacing: 1.00em)

  // Configure lists.
  set enum(indent: 9pt, body-indent: 9pt)
  set list(indent: 9pt, body-indent: 9pt)

  // Configure headings.
  set heading(numbering: "1.")
  show heading: it => locate(loc => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }
    if it.level == 1 [
      // First-level headings are centered smallcaps.
      // We don't want to number of the acknowledgment section.
      #set par(first-line-indent: 0pt)
      #let is-ack = it.body in ([謝辞], [謝　辞], [謝　　辞], [Acknowledgement])
      #set align(center)
      #set text(size: 10pt, font: english, weight: "bold")
      #show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(size: 10pt, font: gothic) // 日本語のときだけゴシック体に変更
      #show "．": set text(font: gothic)　// 全角ピリオドのときだけゴシック体に変更
      #show "，": set text(font: gothic)　// 全角ピリオドのときだけゴシック体に変更
      #v(20pt, weak: true)
      #if it.numbering != none and not is-ack {
        numbering("1.", ..levels)
        h(8pt, weak: true)
      }
      #it.body
      #v(13.75pt, weak: true)
    ] else [
      // The other level headings are run-ins.
      #set par(first-line-indent: 0pt)
      #set text(9pt, weight: "bold", font: english)
      #show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(size: 10pt, font: gothic) // 日本語のときだけゴシック体に変更
      #show "．": set text(font: gothic)　// 全角ピリオドのときだけゴシック体に変更
      #show "，": set text(font: gothic)　// 全角ピリオドのときだけゴシック体に変更
      #v(9pt, weak: true)
      #if it.numbering != none {
        numbering("1.", ..levels)
        h(8pt, weak: true)
      }
      #it.body
      #v(10pt, weak: true)
    ]
  })

  show figure.where(kind: table): set figure(placement: top, supplement: [Table ])
  show figure.where(kind: table): set figure.caption(position: top, separator: [ ])
  show figure.where(kind: image): set figure(placement: top, supplement: [Fig.])
  show figure.where(kind: image): set figure.caption(position: bottom, separator: [ ])
  
  // Start two column mode and configure paragraph properties.
  show: columns.with(2, gutter: 8mm)

  // Display the paper's contents.
  body

  // Display bibliography.
  if bibliography != none {
    show std-bibliography: set text(9pt)
    show regex("[0-9a-zA-Z]"): set text(font: english)
    set std-bibliography(title: align(center, text(10pt)[参　考　文　献]), style: "jasnaoe-conf.csl")
    bibliography
  }
}
