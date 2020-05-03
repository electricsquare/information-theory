#!/bin/bash

# Install everything needed to build the presentation on Ubuntu

echo "Updating Repository List"
sudo apt update -y -q

echo "Installing Pandoc"
sudo apt install -y -q pandoc

echo "Installing pip"
sudo apt install -y -q python3-pip

echo "Installing matplotlib (for pandoc-pyplot)"
python3 -m pip install -U matplotlib

echo "Installing numpy (for pandoc-pyplot)"
python3 -m pip install -U numpy

# https://github.com/LaurentRDC/pandoc-plot
if [[ ! -f "pandoc-plot" ]]
then
    echo "Downlaoding pandoc-plot"
    wget https://github.com/LaurentRDC/pandoc-plot/releases/download/0.3.0.0/pandoc-plot-linux-x86_64.tar.xz -O pandoc-plot-linux-x86_64.tar.xz

    echo "Checking if hash matches what's expected..."
    md5sum -c <<<"de5f748b900c79f5506740866495879d pandoc-plot-linux-x86_64.tar.xz"

    echo "Decompressing pandoc-plot"
    tar -xf pandoc-plot-linux-x86_64.tar.xz

    echo "Deleting pandoc-plot-linux-x86_64.tar.xz"
    rm pandoc-plot-linux-x86_64.tar.xz
fi

