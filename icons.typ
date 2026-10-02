
#let icon-none(w: 4cm, color: black, sw: 1.6pt) = {
}

#let icon-soc-board(w: 4cm, color: black, sw: 1.6pt) = {
  let h = w * 0.68
  let chip = w * 0.32
  let cx = w / 2
  let cy = h / 2
  box(width: w, height: h, {
    // board outline
    place(rect(width: w, height: h, radius: w * 0.02, stroke: sw + color))
    // mounting holes in corners
    let m = w * 0.06
    for (dx, dy) in ((m, m), (w - m, m), (m, h - m), (w - m, h - m)) {
      place(dx: dx - w * 0.014, dy: dy - w * 0.014, circle(radius: w * 0.014, stroke: sw * 0.6 + color))
    }
    // central chip package
    place(dx: cx - chip / 2, dy: cy - chip / 2, rect(width: chip, height: chip, stroke: sw + color))
    // pin-1 indicator dot
    place(dx: cx - chip / 2 + w * 0.02, dy: cy - chip / 2 + w * 0.02,
      circle(radius: w * 0.012, fill: color, stroke: none))
    // pins: tick marks along all four chip edges
    let n = 5
    for i in range(n) {
      let t = (i + 0.5) / n
      let along = chip * t
      place(dx: cx - chip / 2 + along, dy: cy - chip / 2 - w * 0.035,
        line(start: (0pt, 0pt), end: (0pt, w * 0.035), stroke: sw * 0.6 + color))
      place(dx: cx - chip / 2 + along, dy: cy + chip / 2,
        line(start: (0pt, 0pt), end: (0pt, w * 0.035), stroke: sw * 0.6 + color))
      place(dx: cx - chip / 2 - w * 0.035, dy: cy - chip / 2 + along,
        line(start: (0pt, 0pt), end: (w * 0.035, 0pt), stroke: sw * 0.6 + color))
      place(dx: cx + chip / 2, dy: cy - chip / 2 + along,
        line(start: (0pt, 0pt), end: (w * 0.035, 0pt), stroke: sw * 0.6 + color))
    }
    // orthogonal traces radiating out to via pads
    let via(dx, dy) = place(dx: dx - w * 0.016, dy: dy - w * 0.016, circle(radius: w * 0.016, stroke: sw * 0.7 + color))
    place(dx: cx - chip * 0.3, dy: cy - chip / 2 - w * 0.035,
      line(start: (0pt, 0pt), end: (0pt, -(h * 0.18)), stroke: sw * 0.7 + color))
    place(dx: cx - chip * 0.3 - w * 0.16, dy: cy - chip / 2 - w * 0.035 - h * 0.18,
      line(start: (0pt, 0pt), end: (w * 0.16, 0pt), stroke: sw * 0.7 + color))
    via(cx - chip * 0.3 - w * 0.16, cy - chip / 2 - w * 0.035 - h * 0.18)
    place(dx: cx + chip * 0.3, dy: cy - chip / 2 - w * 0.035,
      line(start: (0pt, 0pt), end: (0pt, -(h * 0.13)), stroke: sw * 0.7 + color))
    place(dx: cx + chip * 0.3, dy: cy - chip / 2 - w * 0.035 - h * 0.13,
      line(start: (0pt, 0pt), end: (w * 0.18, 0pt), stroke: sw * 0.7 + color))
    via(cx + chip * 0.3 + w * 0.18, cy - chip / 2 - w * 0.035 - h * 0.13)
    place(dx: cx - chip / 2 - w * 0.035, dy: cy + chip * 0.25,
      line(start: (0pt, 0pt), end: (-(w * 0.2), 0pt), stroke: sw * 0.7 + color))
    via(cx - chip / 2 - w * 0.035 - w * 0.2, cy + chip * 0.25)
    place(dx: cx + chip / 2 + w * 0.035, dy: cy + chip * 0.15,
      line(start: (0pt, 0pt), end: (w * 0.14, 0pt), stroke: sw * 0.7 + color))
    place(dx: cx + chip / 2 + w * 0.035 + w * 0.14, dy: cy + chip * 0.15,
      line(start: (0pt, 0pt), end: (0pt, h * 0.15), stroke: sw * 0.7 + color))
    via(cx + chip / 2 + w * 0.035 + w * 0.14, cy + chip * 0.15 + h * 0.15)
    place(dx: cx - chip / 2 - w * 0.035, dy: cy - chip * 0.05,
      line(start: (0pt, 0pt), end: (-(w * 0.22), 0pt), stroke: sw * 0.7 + color))
    via(cx - chip / 2 - w * 0.035 - w * 0.22, cy - chip * 0.05)
  })
}

#let icon-server-rack(w: 4cm, color: black, sw: 1.6pt, units: 5) = {
  let w = w * 0.4
  let h = w * 1.5
  let pad = w * 0.05
  let unit-h = (h - pad * 2) / units
  box(width: w, height: h, {
    place(rect(width: w, height: h, radius: w * 0.02, stroke: sw + color))
    place(dx: w * 0.1, dy: h + w * 0.03, rect(width: w * 0.14, height: w * 0.04, stroke: sw * 0.8 + color))
    place(dx: w * 0.76, dy: h + w * 0.03, rect(width: w * 0.14, height: w * 0.04, stroke: sw * 0.8 + color))
    for i in range(1, units) {
      let y = pad + i * unit-h
      place(dx: 0pt, dy: y, line(start: (pad, 0pt), end: (w - pad, 0pt), stroke: sw * 0.7 + color))
    }
    for i in range(units) {
      let y = pad + i * unit-h + unit-h / 2
      place(dx: pad * 1.6, dy: y - w * 0.012, circle(radius: w * 0.012, stroke: sw * 0.6 + color))
    }
  })
}

