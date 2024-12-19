#import "touying/lib.typ": *
#import "@preview/pinit:0.1.4": *
#import "@preview/xarrow:0.3.0": xarrow
#import themes.marvel: *

#set text(font: "Myriad Pro") 

// color-scheme can be navy-red, blue-green, or pink-yellow
#show: marvel-theme.with(aspect-ratio: "16-9",
                   config-info(title: [Band structure calculations that are accurate, efficient, accessible, and scalable],
                     author: [Edward Linscott],
                     date: datetime(year: 2025, month: 1, day: 14),
                     event: [MARVEL Review & Retreat],
                     location: [Grindelwald],
                     references: [references.bib],
                     institution: [Paul Scherrer Institute],
                  ),
                  config-common(
                    datetime-format: "[day padding:none] [month repr:long] [year]"
                  ),
)

#let blcite(reference) = {
  text(fill: white, cite(reference))

}


#title-slide()
== This talk
Our progress on Koopmans functionals over the past year: how are we making them...

- accurate
- efficient
- accessible
- scalable

#pause
#grid(columns: 5, column-gutter: 1em, align: center, row-gutter: 0.5em,
  image("media/mugshots/nicola_colonna.png", height: 50%),
  image("media/mugshots/giovanni_cistaro.jpeg", height: 50%),
  image("media/mugshots/yannick_schubert.jpg", height: 50%),
  image("media/mugshots/miki_bonacci.jpg", height: 50%),
  image("media/mugshots/nicola_marzari.jpeg", height: 50%),
  [Nicola Colonna], [Giovanni Cistaro], [Yannick Schubert], [Miki Bonacci], [Nicola Marzari]
)

= Accurate
== Koopmans functionals
- screening parameters

== Results: molecules
Text
== Results: bulk materials
Text

= Efficient
== Taking advantage of symmetries
Text

= Accessible
== The `koopmans` package
Text

= Scalable
== AiiDA integration
Text

== Machine-learning
Text

= Introduction

== Subsection

#par(justify: true)[#lorem(200)@Linscott2020]

#focus-slide()[Here is a focus slide presenting a key idea]

#matrix-slide()[
  This is a matrix slide
][
  You can use it to present information side-by-side
][
  with an arbitrary number of rows and columns
]

More text appears under the same subsection title as earlier

== New Subsection
But a new subsection starts a new page.

Now, let's cite a nice paper.@Linscott2023

#focus-slide()[Thank you!]

== References
#show bibliography: set text(0.6em)
#bibliography("references.bib", style: "nature-footnote.csl", title: none)
