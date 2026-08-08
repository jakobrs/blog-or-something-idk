#import "horse.typ"
#import "../styling/styling.typ": svg, pdf, mathml

#document(title: "lipu Jakob", "index.html", mathml.f(none)[
  = Welcome to this sort of blog thing

  - #link(<horse>)[On the Cut&Count technique] (#link(<horse_pdf>)[PDF version])
]) <root>

#asset("CNAME", "ud2.no")
#asset("fonts.css", read("../styling/fonts.css"))
#asset("LibertinusSerif-Regular.ttf", read(encoding: none, "../fonts/Libertinus_Serif/LibertinusSerif-Regular.ttf"))
#asset("LibertinusSerif-license.txt", read("../fonts/Libertinus_Serif/OFL.txt"))
#asset("STIXTwoMath-Regular.ttf", read(encoding: none, "../fonts/STIX_Two_Math/STIXTwoMath-Regular.ttf"))
#asset("STIXTwoMath-license.txt", read("../fonts/STIX_Two_Math/OFL.txt"))

#document("horse.html", horse.doc(opts: (other: <horse_mathml>, root: <root>), svg)) <horse>
#document("horse.mathml.html", horse.doc(opts: (other: <horse>, root: <root>), mathml)) <horse_mathml>
#document("horse.pdf", horse.doc(pdf)) <horse_pdf>
