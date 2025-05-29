#show link: set text(fill: blue)
#show link: underline
#set text(font: "Iosevka NF",
          size: 16pt)
#set page(columns: 2)

#place(
  top + center,
  scope: "parent",
  float: true,
  text()[
    Hello! It's a hyplerlink: #link("https://wentam.net/").

    #h(1cm)
  ],
)

= Abstract

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eget condimentum velit. Duis dui enim, mattis vitae metus id, porttitor fringilla tellus. Sed non tincidunt ligula. Aliquam vitae bibendum velit. Nam convallis dui quis hendrerit tempus. Suspendisse vel libero eu felis ultricies congue non elementum quam. In eget odio convallis, volutpat turpis in, sodales tortor. Nam mauris libero, cursus ut urna eu, rhoncus hendrerit nibh. Pellentesque ultricies et diam in ullamcorper. Nulla gravida interdum pulvinar.

#colbreak()

= Math and stuff!

We can do math expressions here:

$ A = pi r^2 $
$ "area" = pi dot "radius"^2 $
$ cal(A) :=
    { x in RR | x "is natural" } $
#let x = 5
$ #x < 17 $

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $
