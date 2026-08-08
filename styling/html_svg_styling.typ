#let problem(name, body) = html.div(class: "problem-box", [
  Problem: #strong(smallcaps(name))
  #html.hr()

  #body
])

#let f(opts, x) = {
  let opts = if opts == none { (:) } else { opts }
  let root = opts.at(default: none, "root")
  let other = opts.at(default: none, "other")

  show math.equation.where(block: false): a => box(html.frame(a))
  show math.equation.where(block: true): a => html.div(class: "display-eqn", html.frame(a))

  html.style(read("style.css"))

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
