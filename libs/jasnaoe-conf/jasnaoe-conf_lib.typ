// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

#let mincho = ("Times New Roman", "MS Mincho", "IPAMincho", "Noto Serif CJK JP", "Hiragino Mincho Pro")
#let gothic = ("Times New Roman", "MS Gothic", "IPAGothic", "Noto Sans CJK JP", "Hiragino Kaku Gothic Pro")

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

  set text(
    size: 9pt,
    font: mincho,
  )
  set par(leading: 1.00em, first-line-indent: 1.00em, justify: true)
  show par: set block(spacing: 1.00em)

  // Configure equation numbering and spacing.
  set math.equation(numbering: numbering.with("(1)"), supplement: [式])
  show math.equation: set block(above: 18pt, below: 18pt)

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
      #v(9pt)
      #set par(first-line-indent: 0pt)
      #let is-ack = it.body in ([謝辞], [謝　辞], [謝　　辞], [Acknowledgement])
      #set align(center)
      #set text(size: 10pt, font: gothic, weight: "bold")
      // #v(9pt, weak: true)
      #if it.numbering != none and not is-ack {
        numbering("1.", ..levels)
        h(8pt, weak: true)
      }
      #it.body
      #v(9pt)
    ] else [
      // The other level headings are run-ins.
      #v(9pt, weak: true)
      #set par(first-line-indent: 0pt)
      #set text(size: 9pt, font: gothic, weight: "bold")
      #if it.numbering != none {
        numbering("1.", ..levels)
        h(8pt, weak: true)
      }
      #it.body
    ]
  })

  show figure.where(kind: table): set figure(placement: top, supplement: [Table ])
  show figure.where(kind: table): set figure.caption(position: top, separator: [ ])
  show figure.where(kind: image): set figure(placement: top, supplement: [Fig.])
  show figure.where(kind: image): set figure.caption(position: bottom, separator: [ ])
  
  // Start two column mode and configure paragraph properties.
  show: columns.with(2, gutter: 4mm)

  // Display the paper's contents.
  body

}
