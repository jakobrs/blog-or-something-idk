#let problem(name, body) = html.div(class: "problem-box", [
  Problem: #strong(smallcaps(name))
  #html.hr()

  #body
])

#let f(x) = [
  #show math.equation.where(block: false): a => box(html.frame(a))
  #show math.equation.where(block: true): a => html.div(class: "display-eqn", html.frame(a))

  #html.style(read("style.css"))

  #x

  #html.hr(class: "footnote-sep")

  #html.div(class: "version-link")[#link("/mathml.html")[MathML version]]
  #html.script(read("notes.js"))
]
