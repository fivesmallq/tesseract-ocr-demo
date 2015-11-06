#!/bin/bash
## 执行改批处理前先要目录下创建font_properties文件

lang="number"
font="font"


echo Run Tesseract for Training..
tesseract ${lang}.font.exp0.tif ${lang}.${font}.exp0 nobatch box.train

echo Compute the Character Set..
unicharset_extractor ${lang}.${font}.exp0.box
mftraining -F font_properties -U unicharset -O ${lang}.unicharset ${lang}.${font}.exp0.tr

echo Clustering..
cntraining ${lang}.${font}.exp0.tr

echo Rename Files..
mv normproto ${lang}.normproto
mv inttemp ${lang}.inttemp
mv pffmtable ${lang}.pffmtable
mv shapetable ${lang}.shapetable

echo Create Tessdata..
combine_tessdata ${lang}.