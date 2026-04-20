#let problem(name, body) = html.div(class: "problem-box", [
  Problem: #strong(smallcaps(name))
  #html.hr()

  #body
])

#let f(x) = [
  #html.style(read("style.css"))

  #x

  #html.hr(class: "footnote-sep")

  #html.div(class: "version-link")[#link("/")[SVG version]]
  #html.script(read("notes.js"))
]
