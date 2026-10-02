Experimental Typst/touying Template for Slides
==============================================

Installation
------------

Briefly: clone into your local packages and import as
`"@d3s/course-slides:0.1.0": *`.

Clone into your package path.

    cd "$( typst info -f json | jq -r '.packages["package-path"]' )"
    mkdir -p d3s/course-slides
    cd d3s/course-slides
    git clone https://github.com/d-iii-s/typst-d3s-course-slides.git 0.1.0

Use in your slides.

    #import "@d3s/course-slides:0.1.0": *

    #show: d3s-slides.with(
      title: [Presentation title],
      subtitle: [Subtitle],
      author: [Author Name],
      date: [2026-10-01],
      icon: icon-soc-board,
    )

Available features
------------------

- Icons on the index slide
  - `icon-soc-board`
  - `icon-server-rack`
- Delimiting slide with `#divider-slide[text]`
- Footnote-style text for sources `#source-note`
- Alert box `#alert-box`

