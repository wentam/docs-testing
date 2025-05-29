#set page(margin: (x: 0pt, y: 0pt))
#set text(font: "Iosevka NF",
          size: 16pt)

= Heading

Hello typst

#link("https://wentam.net/")

$ A = pi r^2 $
$ "area" = pi dot "radius"^2 $
$ cal(A) :=
    { x in RR | x "is natural" } $
#let x = 5
$ #x < 17 $

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $
