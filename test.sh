# for d in *.pdf ; do inkscape --without-gui --file=$d --export-plain-svg=${d%.*}.svg --export-background=#FFFFFF ; done

for d in *.pdf; do
  svg="${d%.*}.svg"
  inkscape --without-gui --file="$d" --export-plain-svg="$svg"

  # Insert a white background rect as the first child of <svg>
  # Using 'sed' to add after the <svg ...> tag (assumes it's all on one line)
  sed -i 's|<svg[^>]*>|&<rect width="100%" height="100%" fill="#FFFFFF"/>|' "$svg"

  # Optional: change text fill color to black (adjust as needed)
  sed -i 's/fill:[^;"]*/fill:#000000/g' "$svg"
done
