
t="README.typ"
tmpfile=$(mktemp)
echo "#set text(fill: white)" > $tmpfile
cat "$t" >> $tmpfile
typst compile $tmpfile docs/README-dark.pdf
typst compile $t docs/README-light.pdf

for d in docs/*.pdf; do
  svg="${d%.*}.svg"
  inkscape --without-gui --file="$d" --pdf-poppler --export-plain-svg="$svg"
done
