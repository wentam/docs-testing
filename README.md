Github doesn't render typst files yet (pls github), so we do a typst -> pdf -> svg compilation,
then embed the svg here.

This means no clickable links, so we'll list them here:
* <https://wentam.net/>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="doc_build/README-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="doc_build/README-light.svg">
  <img alt="Fallback image description" src="default-image.png">
</picture>

