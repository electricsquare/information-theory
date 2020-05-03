rm -r plots
pandoc -t revealjs -s presentation.md -o index.html --mathml --filter "./pandoc-plot" --filter pandoc-citeproc
