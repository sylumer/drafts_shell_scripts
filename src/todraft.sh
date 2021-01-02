#!/bin/zsh
# Version 1.0.0
# Stephen Millard, ThoughtAsylum.com

STDIN=$(</dev/stdin)

# Get any additional arguments as tags
for tag in "$@"
do
	TAGS=$TAGS,\"$tag\"
done
if test "$#" -ne 0; then
	TAGS=${TAGS:1}
fi

# Add a new draft with STDIN as the content and the arguments as tags
RETURN=$(osascript -e 'tell application "Drafts"
	make new draft with properties {content: "'$STDIN'", flagged: false, tags: {'$TAGS'}}
end tell')

# Remove the 'draft id ' prefix to just return the draft ID
echo ${RETURN:9}