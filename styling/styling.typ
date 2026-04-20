#import "html_svg_styling.typ" as svg
#import "html_mathml_styling.typ" as mathml
#import "pdf_styling.typ" as pdf

#let env = sys.inputs.at(default: "html", "format")
#let lib = if env == "html" { svg } else if env == "mathml" { mathml } else { pdf }
