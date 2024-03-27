#import "@preview/showybox:2.0.1": *

#let law(title,..content) = {
  showybox(
    title: text(size:1.2em)[*Law: * #title],
    title-style:(
      boxed-style:(
        anchor:(
          x: start
        )
      )
    ),

    frame:(
      title-color: green.darken(30%),
      body-color: green.lighten(80%),
      border-color: green.darken(60%)
    ),
    ..content,
  )
}

#let definition(title,..content) = {
  showybox(
    title: text(size:1.2em)[*Definition: * #title],
    title-style:(
      boxed-style:(
        anchor:(
          x: start
        )
      )
    ),

    frame:(
      title-color: blue.darken(30%),
      body-color: blue.lighten(80%),
      border-color: blue.darken(60%)
    ),
    ..content,
  )
}

#let theorem(title,..content) = {
  showybox(
    title: text(size:1.2em)[*Theorem: * #title],
    title-style:(
      color: black,
      boxed-style:(
        anchor:(
          x: start
        )
      )
    ),

    frame:(
      title-color: teal,
      body-color: eastern.lighten(80%),
      border-color: eastern.darken(60%)
    ),
    ..content,
  )
}

#let prereqs(title,..content) = {
  showybox(
    title: text(size:1.2em)[#title],
    title-style:(
      color: black,
      boxed-style:(
        anchor:(
          x: start
        )
      )
    ),

    frame:(
      title-color: teal,
      body-color: eastern.lighten(80%),
      border-color: eastern.darken(60%)
    ),
    ..content,
  )
}

#let statement(title,..content) = {
  showybox(
    title: text(size:1.2em)[*Statement: #title*],

    frame:(
      title-color: red.lighten(10%),
      body-color: red.lighten(80%),
      border-color: red.darken(60%)
    ),
    ..content,
  )
}

#let warn(title,content) = {
  rect(
    width: 100%,
    stroke:(left:4pt + yellow.darken(10%)),
    inset: 10pt,
    fill: luma(95%),
  )[
    #emoji.warning
    #text(weight: "bold",size: 1.2em, title)
    #linebreak()
    #content
  ]
}

#let answer(content) = rect(fill: luma(240), stroke: (left: 0.25em))[
    #content
  ]


#let template(doc) = {
  set text(
    font: ("Linux Libertine", "STSong")
  )

  set page(
    paper:"a4",
  )
  set heading(
    numbering: "1.1 ",
    bookmarked: true,
  )
  show heading.where(level: 1): it => {
    set align(center)
    it
  }
  show heading.where(level: 2): it => {
    set align(center)
    it
  }
  set enum(indent: 2em,numbering: "A)")
  doc
}