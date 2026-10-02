// D3S Slides

#import "@preview/touying:0.8.0": *
#import themes.aqua: *

#import "colors.typ": *
#import "icons.typ": *
#import "components.typ": *

// ---- The shared show-rule wrapper every lecture file uses ----
#let d3s-slides(
  title: none,
  subtitle: [Course Slides],
  author: [Your Name],
  date: datetime.today(),
  icon: icon-none,
  body,
) = {
  show: aqua-theme.with(
    aspect-ratio: "16-9",
    config-info(title: title, subtitle: subtitle, author: author, date: date),
    config-colors(
      primary: brand-green,
      primary-light: brand-green.lighten(25%),
      primary-lightest: brand-green.lighten(88%),
      neutral-lightest: white,
    ),
  )
  set heading(numbering: none)
  set text(size: 20pt)      // Aqua's default is 20pt
  set list(spacing: 1.02em)
  set enum(spacing: 1.02em)
  // Swap Aqua's default "graduation cap" background for a big,
  // pale server-rack watermark, keeping the theme's corner dots
  // (they already pick up the new primary color automatically).
  show: touying-set-config.with(
    utils.merge-dicts(
      config-common(slide-fn: d3s-slide),
      config-page(margin: (top: 4.3em)),
      config-store(background: self => {
        let (page-width, page-height) = utils.get-page-dimensions(self)
        place(left + top, dx: -15pt, dy: -26pt, circle(radius: 40pt, fill: self.colors.primary))
        place(left + top, dx: 65pt, dy: 12pt, circle(radius: 21pt, fill: self.colors.primary))
        place(left + top, dx: 3%, dy: 15%, circle(radius: 13pt, fill: self.colors.primary))
        place(left + top, dx: 2.5%, dy: 27%, circle(radius: 8pt, fill: self.colors.primary))
        place(right + bottom, dx: 15pt, dy: 26pt, circle(radius: 40pt, fill: self.colors.primary))
        place(right + bottom, dx: -65pt, dy: -12pt, circle(radius: 21pt, fill: self.colors.primary))
        place(right + bottom, dx: -3%, dy: -15%, circle(radius: 13pt, fill: self.colors.primary))
        place(right + bottom, dx: -2.5%, dy: -27%, circle(radius: 8pt, fill: self.colors.primary))
        place(
          center + horizon,
          dy: -4.5%,
          icon(w: page-width * 0.52, color: self.colors.primary.lighten(72%), sw: 1.6pt),
        )
      }),
    )
  )
  title-slide(extra: subtitle)
  body
}

