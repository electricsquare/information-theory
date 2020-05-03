#!/bin/bash

# Delete plots folder as all plots are automatically regenerated
rm -r plots

# Build presentation.md into a reveal.js presentation at index.html
pandoc -t revealjs -s presentation.md -o index.html --mathml --filter "./pandoc-plot" --filter pandoc-citeproc
