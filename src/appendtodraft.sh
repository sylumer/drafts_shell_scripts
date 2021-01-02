#!/bin/zsh
# Version 1.0.0
# Stephen Millard, ThoughtAsylum.com

open "drafts5://append?uuid=$1&text=$(</dev/stdin)"
