
t="README.typ"
tmpfile=$(mktemp)
echo "#set page(margin: (x: 0pt, y: 0pt))" > $tmpfile
echo "#set text(fill: white)" >> $tmpfile
cat "$t" >> $tmpfile
typst compile $tmpfile docs/README-dark.pdf

tmpfile2=$(mktemp)
echo "#set page(margin: (x: 0pt, y: 0pt))" > $tmpfile2
echo "#set text(fill: black)" >> $tmpfile2
cat "$t" >> $tmpfile2
typst compile $tmpfile2 docs/README-light.pdf

tmpfile3=$(mktemp)
echo "#set page(margin: (x: 20pt, y: 20pt))" > $tmpfile3
echo "#set text(fill: black)" >> $tmpfile3
cat "$t" >> $tmpfile3
typst compile $tmpfile3 docs/README-embed-light.pdf

tmpfile4=$(mktemp)
echo "#set page(margin: (x: 20pt, y: 20pt))" > $tmpfile4
echo '#set page(fill: rgb("0d1117"))' >> $tmpfile4
echo "#set text(fill: white)" >> $tmpfile4
cat "$t" >> $tmpfile4
typst compile $tmpfile4 docs/README-embed-dark.pdf


for d in docs/*.pdf; do
  svg="${d%.*}.svg"
  inkscape --without-gui --file="$d" --pdf-poppler --export-plain-svg="$svg"
done
