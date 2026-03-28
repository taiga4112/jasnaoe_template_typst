#import "libs/jasnaoe-conf/cover_lib.typ": jasnaoe-cover

#let info = yaml("info.yaml")

// cover
#if info.at("cover", default: false) {
  jasnaoe-cover(info)
  pagebreak()
}

//contents
#include "contents.typ"