GITHUB_PAGES_URL = "https://wentam.github.io/typst-on-gh/"

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2)) 

DOC_SRCS              = $(call rwildcard,,*.typ)
DOC_DARK_PDFS         = $(DOC_SRCS:%.typ=docs/typ-build/%-dark.typ.pdf)
DOC_LIGHT_PDFS        = $(DOC_SRCS:%.typ=docs/typ-build/%-light.typ.pdf)
DOC_EMBED_DARK_PDFS   = $(DOC_SRCS:%.typ=docs/typ-build/%-embed-dark.typ.pdf)
DOC_EMBED_LIGHT_PDFS  = $(DOC_SRCS:%.typ=docs/typ-build/%-embed-light.typ.pdf)
DOC_DARK_SVGS         = $(DOC_SRCS:%.typ=docs/typ-build/%-dark.typ.svg)
DOC_LIGHT_SVGS        = $(DOC_SRCS:%.typ=docs/typ-build/%-light.typ.svg)
DOC_MDS               = $(DOC_SRCS:%.typ=%.md)
DOC_HTMLS             = $(DOC_SRCS:%.typ=docs/typ-build/%.typ.html)

.PHONY: docs
docs: ${DOC_DARK_PDFS} ${DOC_LIGHT_PDFS} ${DOC_EMBED_DARK_PDFS} ${DOC_EMBED_LIGHT_PDFS} ${DOC_DARK_SVGS} ${DOC_LIGHT_SVGS} ${DOC_MDS} $(DOC_HTMLS)

.PHONY: clean
clean:
	rm -fr docs/typ-build/
	rm $(DOC_MDS)

define DOC_HTML_HEAD
  <head>
    <style>
      * { margin: 0; padding; 0; }
      #pdf-dark { display:none; }
      @media (prefers-color-scheme: dark) {
        #pdf-light { display: none; }
        #pdf-dark { display: block; }
      }
    </style>
  </head>
endef
export DOC_HTML_HEAD

docs/typ-build/%.typ.html: %.typ
	mkdir -p "$$(dirname $@)"
	echo '<html>' > $@
	echo "$$DOC_HTML_HEAD" >> $@
	echo '  <body>' >> $@
	echo "    <object id=\"pdf-light\" type=\"application/pdf\" data=\"$$(basename $< .typ)-embed-light.typ.pdf\" style=\"width:100vw;height:100vh;border:0;margin:0;\"></object>" >> $@
	echo "    <object id=\"pdf-dark\" type=\"application/pdf\" data=\"$$(basename $< .typ)-embed-dark.typ.pdf\" style=\"width:100vw;height:100vh;border:0;margin:0;\"></object>" >> $@
	echo '  </body>' >> $@
	echo '</html>' >> $@

%.md: %.typ
	echo '<p align="center" dir="auto">' > $@
	echo "  <a href=\"$(GITHUB_PAGES_URL)/typ-build/$<.html\" target=\"_blank\" rel=\"noopener noreferrer\">" >> $@
	echo '    <picture>' >> $@
	file="$<"; \
	echo "      <source media=\"(prefers-color-scheme: dark)\" srcset=\"/docs/typ-build/$${file%.*}-dark.typ.svg\">" >> $@; \
	echo "      <source media=\"(prefers-color-scheme: light)\" srcset=\"/docs/typ-build/$${file%.*}-light.typ.svg\">" >> $@; \
	echo '      <img alt="Fallback image description" src="default-image.png">' >> $@
	echo '    </picture>' >> $@
	echo '  </a>' >> $@
	echo '</p>' >> $@

docs/typ-build/%.typ.svg: docs/typ-build/%.typ.pdf
	mkdir -p "$$(dirname $@)"
	inkscape --without-gui --file="$<" --pdf-poppler --export-plain-svg="$@"

docs/typ-build/%-dark.typ.pdf: %.typ
	mkdir -p "$$(dirname $@)"
	tmpfile="$$(mktemp)"; \
	echo "#set page(margin: (x: 0pt, y: 0pt))" > $$tmpfile; \
	echo "#set text(fill: white)" >> $$tmpfile; \
	cat "$<" >> $$tmpfile; \
	typst compile "$$tmpfile" $@

docs/typ-build/%-embed-dark.typ.pdf: %.typ
	mkdir -p "$$(dirname $@)"
	tmpfile="$$(mktemp)"; \
	echo "#set page(margin: (x: 20pt, y: 20pt))" > $$tmpfile; \
	echo '#set page(fill: rgb("0d1117"))' >> $$tmpfile; \
	echo "#set text(fill: white)" >> $$tmpfile; \
	cat "$<" >> $$tmpfile; \
	typst compile "$$tmpfile" $@

docs/typ-build/%-light.typ.pdf: %.typ
	mkdir -p "$$(dirname $@)"
	tmpfile="$$(mktemp)"; \
	echo "#set page(margin: (x: 0pt, y: 0pt))" > $$tmpfile; \
	echo "#set text(fill: black)" >> $$tmpfile; \
	cat "$<" >> $$tmpfile; \
	typst compile "$$tmpfile" $@

docs/typ-build/%-embed-light.typ.pdf: %.typ
	mkdir -p "$$(dirname $@)"
	tmpfile="$$(mktemp)"; \
	echo "#set page(margin: (x: 20pt, y: 20pt))" > $$tmpfile; \
	echo "#set text(fill: black)" >> $$tmpfile; \
	cat "$<" >> $$tmpfile; \
	typst compile "$$tmpfile" $@
