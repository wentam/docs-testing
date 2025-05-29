mkdir -p doc_build/

t="README.typ"
tmpfile=$(mktemp)
echo "#set text(fill: white)" > $tmpfile
cat "$t" >> $tmpfile
typst compile $tmpfile doc_build/README-dark.pdf
typst compile $t doc_build/README-light.pdf

for d in doc_build/*.pdf; do
  svg="${d%.*}.svg"
  inkscape --without-gui --file="$d" --pdf-poppler --export-plain-svg="$svg"
done
