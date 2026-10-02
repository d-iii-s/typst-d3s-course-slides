#import "@preview/touying:0.8.0": *
#import themes.aqua: *

#import "colors.typ": *

// ---- A bordered callout box for warnings/important notes ----
// framed in the site's alert color.
// Usage: #alert-box(title: [Warning:])[body]
#let alert-box(title: none, body) = block(
  fill: white,
  stroke: 1.8pt + brand-alert,
  radius: 4pt,
  inset: 10pt,
  width: 100%,
)[
  #if title != none [#text(fill: brand-alert, weight: "bold")[#title] ]
  #body
]

#let source-note(body) = place(
  bottom + left,
  dy: 0.5em,
  text(size: 0.65em, fill: rgb("#666666"))[#body],
)

#let d3s-slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  let header(self) = {
    place(
      center + top,
      dy: .7em,              // was .5em
      rect(
        width: 100%,
        height: 2.6em,        // was 1.8em — the bar itself
        fill: self.colors.primary,
        align(
          left + horizon,
          h(1.5em) + text(size: 1.8em, fill: white, utils.call-or-display(self, self.store.header)),
          // added: size: 1.3em — the header font
        ),
      ),
    )
    place(left + top, line(
      start: (89%, 0%),
      end: (86%, 160%),
      stroke: 0.9em + white,  // was .5em — scale the cut with the taller bar
    ))
    place(
      right + top,
      dx: -.5em,
      dy: .7em,
      box(height: 2.6em, align(horizon, image("d3s-logo-white.svg", height: 1.6em))),
    )
  }
  let footer(self) = {
    set text(size: 0.8em)
    place(right, dx: -5%, utils.call-or-display(self, utils.call-or-display(self, self.store.footer)))
  }
  let self = utils.merge-dicts(self, config-page(header: header, footer: footer))
  touying-slide(self: self, config: config, repeat: repeat, setting: setting, composer: composer, ..bodies)
})


#let divider-slide(title, size: 60pt, config: (:)) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      margin: (left: 0%, right: 0%, top: 0%, bottom: 0%),
      background: utils.call-or-display(self, self.store.background),
    ),
  )
  touying-slide(
    self: self,
    config: config,
    setting: body => align(
      center + horizon,
      text(fill: self.colors.primary, size: size, weight: "bold", title),
    ),
    [],
  )
})

