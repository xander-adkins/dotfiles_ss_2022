#!/bin/sh
#Returns the current playing song in Cmus

cmus-remote -Q | grep tag | head -n 3 | sort -r | cut -d ' ' -f 3- | sed -e :a -e '$!N; s/\n/ - /; ta' 


