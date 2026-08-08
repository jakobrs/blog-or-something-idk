#let problem(name, body) = html.div(class: "problem-box", [
  Problem: #strong(smallcaps(name))
  #html.hr()

  #body
])

#let f(opts, x) = {
  let opts = if opts == none { (:) } else { opts }
  let root = opts.at(default: none, "root")
  let other = opts.at(default: none, "other")
  let math_mode = opts.at(default: false, "math")

  show math.equation.where(block: false): a => box(html.frame(a))
  show math.equation.where(block: true): a => html.div(class: "display-eqn", html.frame(a))

  html.link(rel: "stylesheet", href: "/fonts.css")
  let style = read("../styling/style.css")
  if math_mode {
    style = style + read("../styling/math.css")
  } else {
    style = style + read("../styling/general.css")
  }
  html.style(style)

  counter(footnote).update(0)

  if root != none {
    html.header(link(root)[Home])
  }

  x

  html.hr(class: "footnote-sep")

  if other != none {
    html.div(class: "version-link", link(other)[MathML version])
  }
  html.script(read("notes.js"))
}
