# for d in *.pdf ; do inkscape --without-gui --file=$d --export-plain-svg=${d%.*}.svg --export-background=#FFFFFF ; done


for t in *.typ; do
  typst compile $t
done

for d in *.pdf; do
  svg="${d%.*}.svg"
  inkscape --without-gui --file="$d" --export-plain-svg="$svg"

  # TODO add <rect width="100%" height="100%" fill="#ffffff"/> inside svg element at top
done
