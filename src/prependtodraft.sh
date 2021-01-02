#!/bin/zsh
# Version 1.0.0
# Stephen Millard, ThoughtAsylum.com

open "drafts5://prepend?uuid=$1&text=$(</dev/stdin)"
