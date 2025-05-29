
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
cat "$t" > $tmpfile3
typst compile $tmpfile3 docs/README-embed.pdf

for d in docs/*.pdf; do
  svg="${d%.*}.svg"
  inkscape --without-gui --file="$d" --pdf-poppler --export-plain-svg="$svg"
done
