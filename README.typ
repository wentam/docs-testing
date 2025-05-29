#show link: set text(fill: blue)
#show link: underline
#set text(font: "Iosevka NF",
          size: 12pt)
#set page(columns: 2)

#let title = [ Tricking GitHub into displaying rendered typst documents ]
#let subtitle = [ Pls GitHub add this ]
//#let subtitle = [ TL;DR: typ -> pdf -> svg. Embed svg in md. Embed pdf in html. Click svg in md = go to html. ]

#place(
  top + center,
  scope: "parent",
  float: true,
  text()[
    #v(0.5cm)

    = #title

    #subtitle

    #v(1cm)
  ],
)

= TL;DR:

+ typ -> pdf
+ pdf -> svg
+ Embed svg in md
+ Embed pdf in html on GitHub pages.
+ Make svg in md clickable to go to html for interactivity (like #link("https://wentam.net/")[ links]).

= Implemented via makefile

The makefile will recursively trudge through the repo it's placed in, building svgs, pdfs, and html
files as needed to support all situations. Markdown files are then generated next to each .typ file
to reference these resources.


= Dark mode and light mode!

By referencing your browser settings, this is able to support both dark mode and light mode in both
the .md files and the html files - try changing your browser settings for this and see what happens!

#colbreak()

= Dependencies

- typst
- inkscape
  - For pdf to svg conversion
- mktemp
  - Used in makefile

#h(1cm)

= Checklist

- Copy makefile into your repo
- Enable GitHub pages in your repo pointing to the docs/ subdirectory
- Update GITHUB_PAGES_URL in the makefile
  - Needed to to find your github pages site in the markdown file
- Run make
