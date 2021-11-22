#!/bin/bash

cd docs
rm _build
make singlehtml
rm -rf _build/singlehtml/_static
