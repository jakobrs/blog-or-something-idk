#!/usr/bin/env bash
rm docs/*
typst compile --root "$PWD" --features bundle,html --format bundle posts/root.typ docs --creation-timestamp 0
