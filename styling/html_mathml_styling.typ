#let problem(name, body) = html.div(class: "problem-box", [
  Problem: #strong(smallcaps(name))
  #html.hr()

  #body
])

#let math_mode = html.style(read("../styling/math.css"))

#let f(opts, x) = {
  let opts = if opts == none { (:) } else { opts }
  let root = opts.at(default: none, "root")
  let other = opts.at(default: none, "other")

  html.link(rel: "stylesheet", href: "/fonts.css")
  html.style(read("../styling/style.css"))

  counter(footnote).update(0)

  if root != none {
    html.header(link(root)[Home])
  }

  x

  html.hr(class: "footnote-sep")

  if other != none {
    html.div(class: "version-link", link(other)[SVG version])
  }
  html.script(read("notes.js"))
}
