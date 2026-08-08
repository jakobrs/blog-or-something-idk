#import "horse.typ"
#import "../styling/styling.typ": svg, pdf, mathml

#document(title: "lipu Jakob", "index.html", mathml.f(none)[
  = Welcome to this sort of blog thing

  - #link(<horse>)[On the Cut&Count technique] (#link(<horse_pdf>)[PDF version])
]) <root>

#asset("CNAME", "ud2.no")
#document("horse.html", horse.doc(opts: (other: <horse_mathml>, root: <root>), svg)) <horse>
#document("horse.mathml.html", horse.doc(opts: (other: <horse>, root: <root>), mathml)) <horse_mathml>
#document("horse.pdf", horse.doc(pdf)) <horse_pdf>
