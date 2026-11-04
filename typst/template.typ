// IMSLab / NYCU slides. Geometry follows the source PPTX (780 × 540 pt).
#let colors = (
  teal: rgb("1eb8c1"),
  orange: rgb("ef7920"),
  gray: rgb("595959"),
  header: rgb("424242"),
  panel: rgb("f2f2f2"),
)

#let settings = state("imslab-settings", (:))

#let imslab(
  title: "Title",
  author: "Haowen Zheng",
  date: "20xx/xx/xx",
  institution: "National Yang Ming Chiao Tung University",
  lab: "IMSLab",
  font: ("Times New Roman", "Libertinus Serif", "Arial Unicode MS"),
  body,
) = {
  set document(title: title, author: author)
  set page(width: 780pt, height: 540pt, margin: 0pt, fill: white)
  set text(font: font, size: 24pt, fill: black, lang: "en")
  set par(leading: 0.35em, spacing: 0.65em, justify: false)
  set list(marker: [•], indent: 0pt, body-indent: 0.9em, spacing: 0.65em)
  set enum(indent: 0pt, body-indent: 0.9em, spacing: 0.65em)
  set heading(numbering: none)
  show heading: set text(size: 1.1em, fill: colors.gray)
  settings.update((title: title, author: author, date: date, institution: institution, lab: lab))
  body
}

// Coordinates are local to each polygon's bounding box, normalized to 0–1.
#let ribbon(x, y, width, height, points, fill) = place(
  top + left, dx: x, dy: y,
  polygon(..points.map(p => (p.at(0) * width, p.at(1) * height)), fill: fill, stroke: none),
)

#let footer(config, width: 633.6pt) = place(
  top + left, dx: 43.2pt, dy: 494pt,
  block(width: width)[
    #set align(right)
    #text(size: 9pt, fill: colors.gray)[#config.author · #config.institution]
  ],
)

#let slide-number(fill: colors.header) = place(
  top + left, dx: 678.3pt, dy: 505.6pt,
  block(width: 73.35pt)[
    #set align(right)
    #text(size: 14pt, fill: fill, counter(page).display("1"))
  ],
)

#let title-slide() = context {
  let config = settings.get()
  page(margin: 0pt)[
    #place(top + left, dy: 143.25pt,
      rect(width: 780pt, height: 260.879pt, fill: colors.panel, stroke: none))
    #ribbon(497.25pt, 143.25pt, 282.75pt, 260.879pt,
      ((0, 0), (1, 0), (1, 1), (0.059925, 1), (0.210487, 0.632407)), colors.gray)
    #ribbon(467.519pt, 143.25pt, 106.979pt, 260.879pt,
      ((0, 0), (0.291140, 0), (1, 0.632407), (0.493672, 1), (0.205063, 1), (0.711391, 0.632407)), colors.orange)
    #ribbon(453.833pt, 143.25pt, 97.771pt, 260.879pt,
      ((0, 0), (0.221606, 0), (1, 0.632407), (0.445983, 1), (0.221607, 1), (0.778394, 0.632407)), colors.teal)
    #place(top + left, dx: 497.25pt, dy: 143.25pt,
      image("assets/cover-photo.png", width: 282.75pt, height: 260.879pt, fit: "stretch", alt: "Radio tower"))
    #place(top + left, dy: 412.357pt,
      image("assets/cover-waves.png", width: 780pt, height: 142.476pt, fit: "stretch", alt: ""))
    #place(top + left, dx: 600.116pt, dy: 2.26pt,
      image("assets/imslab-logo.jpeg", width: 179.884pt, height: 114.047pt, alt: "IMSLab since 2010"))
    #place(top + left, dx: 38.057pt, dy: 178.233pt,
      block(width: 408.576pt, height: 147.6pt)[
        #align(bottom, text(size: 40pt, bottom-edge: "descender", config.title))
      ])
    #place(top + left, dx: 30.857pt, dy: 330.536pt,
      line(length: 448.714pt, stroke: 3pt + colors.teal))
    #place(top + left, dx: 38.057pt, dy: 342.363pt,
      block(width: 408.576pt)[
        #set text(size: 20pt, fill: colors.gray)
        #grid(rows: (39.6pt, auto), [#config.institution], [#strong(config.lab)])
      ])
    #place(top + left, dx: 643.2pt, dy: 420.735pt,
      block(width: 129.6pt)[
        #set text(size: 16.65pt, fill: colors.gray)
        #grid(rows: (36.65pt, auto), [#config.author], [#config.date])
      ])
    #footer(config)
  ]
}

#let outline-slide(items, title: [Outline], numbered: false) = context {
  let config = settings.get()
  page(margin: 0pt)[
    #ribbon(615.604pt, 0pt, 164.396pt, 540pt,
      ((0, 0), (1, 0), (1, 1), (0.131796, 1), (0.462933, 0.632407)), colors.header)
    #ribbon(590.958pt, 0pt, 106.979pt, 540pt,
      ((0, 0), (0.291140, 0), (1, 0.632407), (0.493672, 1), (0.205063, 1), (0.711391, 0.632407)), colors.orange)
    #ribbon(586.896pt, 0pt, 93.437pt, 540pt,
      ((0, 0), (0.185507, 0), (1, 0.632407), (0.420289, 1), (0.234783, 1), (0.814493, 0.632407)), colors.teal)
    #place(top + left, dx: 83.05pt, dy: 3.6pt,
      block(width: 539.827pt, height: 68.524pt)[
        #align(bottom, text(size: 36pt, fill: colors.gray, title))
      ])
    #place(top + left, dx: 57.214pt, dy: 75.724pt,
      rect(width: 483.488pt, height: 6.562pt, fill: colors.orange, stroke: none))
    #place(top + left, dx: 84.417pt, dy: 123pt,
      block(width: 480pt)[
        #set text(size: 24pt)
        #list(tight: false, indent: 0pt, body-indent: 8pt, spacing: 12pt, ..items)
      ])
    #footer(config, width: 490pt)
    #if numbered { slide-number(fill: white) }
  ]
}

#let slide(title, body: [], show-footer: false, numbered: true) = context {
  let config = settings.get()
  page(
    margin: (left: 43.843pt, right: 42pt, top: 144pt, bottom: 89.08pt),
    background: [
      #place(top + left,
        rect(width: 780pt, height: 108pt, fill: colors.header, stroke: none))
      #place(top + left, dy: 108pt,
        rect(width: 780pt, height: 6.471pt, fill: colors.orange, stroke: none))
      #place(top + left, dy: 113.623pt,
        rect(width: 780pt, height: 6.471pt, fill: colors.teal, stroke: none))
      #place(top + left, dy: 450.92pt,
        image("assets/footer-waves.png", width: 780pt, height: 89.08pt, fit: "stretch", alt: ""))
      #place(top + left, dy: 467.357pt,
        image("assets/footer-logo.png", width: 111.163pt, height: 73.935pt, alt: "IMSLab since 2010"))
      #place(top + left, dx: 43.843pt, dy: 17.904pt,
        block(width: 694.261pt, height: 77.839pt)[
          #align(horizon, text(size: 36pt, fill: white, title))
        ])
      #if show-footer { footer(config) }
      #if numbered { slide-number() }
    ],
    body,
  )
}
