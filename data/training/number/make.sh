#!/bin/bash

lang="number"
font="font"


echo Make Box File..
tesseract ${lang}.${font}.exp0.tif ${lang}.${font}.exp0 batch.nochop makebox