# ffmpeg -- Video converter
{:data-section="shell"}
{:data-date="March 15, 2019"}
{:data-extra="Um Pages"}

## SYNOPSIS
ffmpeg [global_options] -i [input_file] [output_file]

## DESCRIPTION
ffmpeg is a very fast video and audio converter that can also grab from a live
audio/video source. It can also convert between arbitrary sample rates and resize
video on the fly with a high quality polyphase filter.


## OPTIONS
`-i`
: Input files

`-aspect`
: Output video aspect ratio [16:9, 4:3]

`-target`
: Target video platform [ntsc-dvd, pal-dvd]

`-threads`
: Maximim cpu threads used by ffmpeg [1,2]

`-b:a`
: Audio bitrate

`-b:v`
: Video bitrate

