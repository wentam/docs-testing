#show link: set text(fill: blue)
#show link: underline
#set text(font: "Iosevka NF",
          size: 12pt)
#set page(columns: 2)

#let title = [ Tricking GitHub into displaying rendered typst documents ]
#let subtitle = [ Pls GitHub add this. ]
//#let subtitle = [ TL;DR: typ -> pdf -> svg. Embed svg in md. Embed pdf in html. Click svg in md = go to html. ]

#place(
  top + center,
  scope: "parent",
  float: true,
  text()[
    *#title*

    #subtitle

    #h(1cm)
  ],
)

= TL;DR:

+ typ -> pdf
+ pdf -> svg
+ Embed svg in md
+ Embed pdf in html on GitHub pages.
+ Make svg in md clickable to go to html for interactivity (like clicking links).

= Implemented via makefile

The makefile will recursively trudge through the repo it's placed in, building svgs, pdfs, and html
files as needed to support all situations. Markdown files are then generated next to each .typ file
to reference these resources.

#colbreak()

= Dark mode and light mode!

By referencing your browser settings, this is able to support both dark mode and light mode in both
the .md files and the html files - try changing your browser settings for this and see what happens!
