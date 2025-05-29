# for d in *.pdf ; do inkscape --without-gui --file=$d --export-plain-svg=${d%.*}.svg --export-background=#FFFFFF ; done

# #set text(fill: white)
t="README.typ"
tmpfile=$(mktemp)
echo "#set text(fill: white)" > $tmpfile
cat "$t" >> $tmpfile
typst compile $tmpfile README-dark.pdf
typst compile $t README-light.pdf

for d in *.pdf; do
  svg="${d%.*}.svg"
  inkscape --without-gui --file="$d" --pdf-poppler --export-plain-svg="$svg"

  # TODO add <rect width="100%" height="100%" fill="#ffffff"/> inside svg element at top
done
