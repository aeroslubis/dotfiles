# convert -- convert between images format, size, blur, crop, and much more
{:data-section="shell"}
{:data-date="March 15, 2019"}
{:data-extra="Um Pages"}

## SYNOPSIS
convert [input-options] input-file [output-options] output-file

## DESCRIPTION
The convert program is a member of the ImageMagick(1) suite of tools. Use it to  con‐vert  between image formats as well as resize an image, blur, crop, despeckle, dither, draw on, flip, join, re-sample, and much more.

## OPTIONS
`-resize`
: Scale an image % to its original size

`+append`
: Horizontally append/combine images

`-geometry`
: Preferred size of the image 

`-quality`
: Reduce image quality

`-strip`
: Remove image profiles and comments

`-trim`
: Get spesific page of pdf file

## EXAMPLES
`Reduce image sizes`
: convert -geometry 50% input.jpg output.jpg

`Reduce raw image sizes and converting to pdf`
: convert -strip -quality 45% input.jpg output.pdf

`Get spesific page of pdf file and saving it to jpg`
: convert -density 300 -trim input.pdf[page_num] -quality 100 output.jpg

`Combine to images to a single file`
: convert +append input01.jpg input02.jpg ... output.jpg
