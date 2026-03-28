#let mincho = ("TeX Gyre Termes", "IPAMincho")
#let gothic = ("TeX Gyre Termes", "IPAGothic")

#let jasnaoe-cover(info) = {
  set page(
    paper: "a4",
    columns: 1,
    margin: (top: 27mm, bottom: 22mm, x: 17mm),
  )
  set text(font: mincho, size: 10pt)
  set par(leading: 1.2em, justify: true)

  show "。": "．"
  show "、": "，"

  v(10pt)

  // Title in Japanese
  align(center, text(font: gothic, size: 14pt, weight: "bold", info.title.ja))

  v(6pt)

  // Title in English
  align(center, text(size: 11pt, info.title.en))

  v(14pt)

  // Authors: name（membership，affiliation）
  align(center, text(size: 10pt,
    info.authors.map(a =>
      a.name.at("ja", default: "") + "（" + a.at("membership", default: "") + "，" + a.at("affiliation", default: "") + "）"
    ).join("　")
  ))

  v(20pt)

  // Abstract box
  align(center, box(width: 160mm)[
    #set text(size: 9pt)
    #set par(first-line-indent: (amount: 1em, all: true), leading: 1.2em, justify: true)
    #let abstract-ja = info.at("abstract", default: (:)).at("ja", default: "")
    #let abstract-en = info.at("abstract", default: (:)).at("en", default: "")
    #text(font: gothic, weight: "bold")[要旨]
    #parbreak()
    #abstract-ja

    #v(10pt)

    #text(font: gothic, weight: "bold")[Abstract]
    #parbreak()
    #abstract-en
  ])
}
