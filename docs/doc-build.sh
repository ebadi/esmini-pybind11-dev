#!/bin/bash

rm _build
make singlehtml
mv _build/singlehtml/index.html .
