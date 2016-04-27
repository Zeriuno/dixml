#! /usr/bin/env bash

pandoc "$@" -f markdown -t latex --latex-engine=xelatex  -s -o "$@".pdf

#Script pour transformer les fichiers Markdown en pdf via LaTeX. Ça devrait marcher, ou bien c'est quelque chose de pas trop différent
