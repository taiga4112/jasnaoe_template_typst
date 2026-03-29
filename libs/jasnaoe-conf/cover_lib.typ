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

  // Collect unique affiliations
  let affiliations = {
    let list = ()
    for a in info.authors {
      let affs = if type(a.affiliation) == array { a.affiliation } else { (a.affiliation,) }
      for aff in affs {
        if list.position(x => x == aff) == none {
          list.push(aff)
        }
      }
    }
    list
  }

  // Title in Japanese
  if info.cover_title_ja_include {
    align(left, text(font: gothic, size: 16pt, weight: "bold", info.title.ja))
    v(0pt)
  }

  // Title in English
  if info.cover_title_en_include {
    align(left, text(size: 12pt, weight: "bold", info.title.en))
    v(0pt)
  }

  v(6pt)

  // Authors in Japanese
  if info.cover_authors_ja_include{
    let author-entries = info.authors.map(a => {
      let affs = if type(a.affiliation) == array { a.affiliation } else { (a.affiliation,) }
      let nums = affs.map(aff => affiliations.position(x => x == aff) + 1)
      let nums-text = nums.map(n => str(n)).join(", ")

      if info.cover_affiliation_include{
        [#a.name.ja#super[#nums-text]]
      }else{
        [#a.name.ja]
      }
    })
    author-entries.join([, ])
    v(0pt)
  }

  // Authors in English
  if info.cover_authors_en_include{
    let author-entries = info.authors.map(a => {
      let affs = if type(a.affiliation) == array { a.affiliation } else { (a.affiliation,) }
      let nums = affs.map(aff => affiliations.position(x => x == aff) + 1)
      let nums-text = nums.map(n => str(n)).join(", ")

      if info.cover_affiliation_include{
        [#a.name.en#super[#nums-text]]
      }else{
        [#a.name.en]
      }
    })
    author-entries.join([, ])
    v(0pt)
  }

  v(20pt)

  // Abstract
  align(left,[
    #set text(size: 9pt)
    #set par(first-line-indent: (amount: 0em, all: true), leading: 1.2em, justify: true)
    #let abstract-ja = info.at("abstract", default: (:)).at("ja", default: "")
    #let abstract-en = info.at("abstract", default: (:)).at("en", default: "")
    
    #if info.cover_abstract_ja_include {
      align(center, text(font: gothic, weight: "bold")[要旨])
      parbreak()
      abstract-ja
    }

    #v(10pt)
    #if info.cover_abstract_en_include {
      align(center, text(font: gothic, weight: "bold")[Abstract])
      parbreak()
      abstract-en
    }
  ])

  if info.cover_affiliation_include {
    v(1fr)
    line(length: 100%)
    for (i, aff) in affiliations.enumerate() [
      #super[#(i + 1)] #aff
      #linebreak()
    ]
  }
}
