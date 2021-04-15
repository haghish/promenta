
cd "/Users/haghish/Documents/GitHub/promenta/publication-ready data analysis with Stata/examples/markdoc/active"

markdoc "chunks.do", markup(markdown) export(docx) replace style("stata")
mini "chunks.do", markup(markdown) export(docx) replace style("stata")
