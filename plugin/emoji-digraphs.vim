" Vim plugin to conditionally expand abbreviations on a matching prefix.
" Maintainer:	GI <gi1242+vim@nospam.com> (replace nospam with gmail)
" Created:	Sun 11 Aug 2019 11:55:39 AM EDT
" Last Changed:	Sun 11 Aug 2019 11:56:50 AM EDT
" Version:	0.1
"
" Description:
"   TODO: Digraphs for standard smileys

let s:digraphs = {
	\ ':)'	    : ['😄', 'smiley'],
	\ ':('	    : ['🙁', 'slightly_frowning_face'],
	\ ';)'	    : ['😉', 'wink'],
	\ ':$'	    : ['😊', 'blush'],
	\ ':D'	    : ['😁', 'grin'],
	\ '8\|'	    : ['😳', 'flushed'],
	\ ':O'	    : ['😲', 'astonished'],
	\ '8O'	    : ['😲', 'astonished'],
	\ ':P'	    : ['😛', 'stuck_out_tongue'],
	\ ';P'	    : ['😜', 'stuck_out_tongue_winking_eye'],
	\ 'XP'	    : ['😝', 'stuck_out_tongue_closed_eyes'],
	\ '%)'	    : ['😖', 'confounded'],
	\ '%/'	    : ['😕', 'confused'],
	\ '8)'	    : ['😎', 'sunglasses'],
	\ 'B)'	    : ['😎', 'sunglasses'],
	\ ':\|'	    : ['😑', 'expressionless'],
	\ ':<'	    : ['😡', 'rage'],
	\ ':/'	    : ['😒', 'unamused'],
	\ '\|O'	    : ['😴', 'sleeping'],
	\ '8/'	    : ['🙄', 'face_with_rolling_eyes'],
	\ ':X'	    : ['🤐', 'zipper_mouth_face'],
\ }


for [ab, em] in items( s:digraphs )
    exec ':digraph' ab char2nr(em[0])
endfor
