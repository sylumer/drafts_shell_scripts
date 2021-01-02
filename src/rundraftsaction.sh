#!/bin/zsh
# Version 1.0.0
# Stephen Millard, ThoughtAsylum.com

if test ! -t 0; then
	# Run with input on STDIN
	STDIN=$(</dev/stdin)
	open "drafts5://runAction?action=$1&text=$STDIN"
else
	# Run with no input on STDIN
	open "drafts5://runAction?action=$1&allowEmpty=true&text="
fi
