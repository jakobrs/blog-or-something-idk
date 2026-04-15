#let problem(name, body) = box(stroke: 1pt, inset: 10pt, width: 100%, [
  Problem: #strong(smallcaps(name))
  #v(-7pt) #line(start: (0% - 10pt, 0% + 0pt), end: (100% + 10pt, 0% + 0pt)) #v(-7pt)

  #body
])

#let f(x) = [
  #x
]
