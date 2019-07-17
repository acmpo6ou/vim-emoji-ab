#! /usr/bin/python3

from munch import *
from collections import defaultdict
import json

with open('emoji.json') as data:
    emojis = [Munch(e) for e in json.load( data )]
    data.close()

aliases = defaultdict( list )
for e in emojis:
    for a in e.aliases:
        aliases[a].append( e.emoji )

    for t in e.tags:
        aliases[t].append( e.emoji )

abbrevs = {}
for t, e in aliases.items():
    for i, em in enumerate( sorted( e ) ):
        ab = t if i == 0 else t + str(i)
        abbrevs[ab] = em

with open( 'abbrevs.vim', 'w' ) as outfile:
    for ab, em in abbrevs.items():
        outfile.write( f"\t\\ '{ab}': '{em}',\n" )
