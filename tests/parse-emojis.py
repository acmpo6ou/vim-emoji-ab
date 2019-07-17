#! /usr/bin/python3

from munch import *
from collections import defaultdict
import json

with open('emoji.json') as data:
    emojis = [Munch(e) for e in json.load( data )]
    data.close()

tags = {}
emojis_of = defaultdict( list )
for e in sorted( emojis, key=lambda e: e.emoji ):
    if e.emoji in tags:
        raise Exception( f'Emoji {e.emoji} already exists with tags '
                + ', '.join( tags[e.emoji] ) + '.' )

    # Store all aliases & tags associated with emoji.
    tags[e.emoji] = sorted( e.aliases + e.tags )

    # Store all emojis associated with a tag.
    for t in tags[e.emoji]:
        emojis_of[t].append( e.emoji )

# Store emojis of tags in a file for inclusion in vim
with open( 'emojis-of-tags.vim', 'w' ) as outfile:
    for t, el in sorted( emojis_of.items() ):
        for i, emoji in enumerate( sorted( el ) ):
            # Suffix tags with more than 1 emoji.
            # train2 is already defined; skip it
            if t == 'train' and i >= 2: i += 1
            tag = t if i == 0 else t + str(i)
            outfile.write( f"\t\\ '{tag}': '{emoji}',\n" )

# Store tags of emojis in a text file for searching
with open( 'tags-of-emojis.txt', 'w' ) as outfile:
    for emoji, tags in sorted( tags.items() ):
        outfile.write( f"{emoji}\t: {', '.join(tags)}.\n" )
