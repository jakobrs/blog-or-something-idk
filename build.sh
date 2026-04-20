#!/usr/bin/env bash

format() {
    case "$1" in
        html) echo html;;
        mathml) echo html;;
        pdf) echo pdf;;
    esac
}
ending() {
    case "$1" in
        html) echo .html;;
        mathml) echo .mathml.html;;
        pdf) echo .pdf;;
    esac
}

compile() {
    for fmt in {html,mathml,pdf}; do
        typst compile --root "$PWD" --features html --format "$(format $fmt)" "posts/$1.typ" "docs/$1$(ending $fmt)" --input "format=$fmt"
    done
}

rm docs/*
cp index.html docs/index.html
compile horse
