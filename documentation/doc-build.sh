#!/bin/bash

rm _build
make singlehtml
rm -rf ../_doc/
mv _build/singlehtml/ ../_doc/
