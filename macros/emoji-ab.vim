" Vim plugin to conditionally expand abbreviations on a matching prefix.
" Maintainer:	GI <gi1242+vim@nospam.com> (replace nospam with gmail)
" Created:	Tue 09 Jul 2019 03:24:42 PM EDT
" Last Changed:	Wed 24 Jul 2019 10:24:34 PM EDT
" Version:	0.1
"
" Description: UTF8 Abbreviations for common smilies

if &encoding != 'utf-8'
    finish
endif

" Some smileys for cut and pasting:
" 😀😁😂😃😅😆😇😈👿😉😊😋😌😍😎😏😐😑😒😓😔😕😖😗😘😙😚😛😜😝😞😟😠😡😢😣
" 😤😥😦😧😨😩😪😫😬😭😮😯😰😱😲😳😴😵😶😷😸😹😺😻😼😽😾😿🙀🙁🙂🙃🙄🙅🙆🙇
" 🙈🙉🙊🙋🙌🙍🙎🙏

" :-) style abbreviations from wikipedia.
" See https://en.wikipedia.org/wiki/Wikipedia:Emoticons
"
let s:smileys = {
	\ ':)'	    : ['😄', 'smiley'],
	\ ':-)'	    : ['😄', 'smiley'],
	\ ':('	    : ['🙁', 'slightly_frowning_face'],
	\ ':-('	    : ['🙁', 'slightly_frowning_face'],
	\ ';)'	    : ['😉', 'wink'],
	\ ';-)'	    : ['😉', 'wink'],
	\ ':$'	    : ['😊', 'blush'],
	\ ':-$'	    : ['😊', 'blush'],
	\ ':D'	    : ['😁', 'grin'],
	\ ':-D'	    : ['😁', 'grin'],
	\ '8\|'	    : ['😳', 'flushed'],
	\ '8-\|'    : ['😳', 'flushed'],
	\ ':O'	    : ['😲', 'astonished'],
	\ ':-O'	    : ['😲', 'astonished'],
	\ '8O'	    : ['😲', 'astonished'],
	\ '8-O'	    : ['😲', 'astonished'],
	\ ':P'	    : ['😛', 'stuck_out_tongue'],
	\ ':-P'	    : ['😛', 'stuck_out_tongue'],
	\ ';P'	    : ['😜', 'stuck_out_tongue_winking_eye'],
	\ ';-P'	    : ['😜', 'stuck_out_tongue_winking_eye'],
	\ 'XP'	    : ['😝', 'stuck_out_tongue_closed_eyes'],
	\ 'X-P'	    : ['😝', 'stuck_out_tongue_closed_eyes'],
	\ '%)'	    : ['😖', 'confounded'],
	\ '%-)'	    : ['😖', 'confounded'],
	\ '%/'	    : ['😕', 'confused'],
	\ '%-/'	    : ['😕', 'confused'],
	\ '8)'	    : ['😎', 'sunglasses'],
	\ '8-)'	    : ['😎', 'sunglasses'],
	\ 'B)'	    : ['😎', 'sunglasses'],
	\ 'B-)'	    : ['😎', 'sunglasses'],
	\ ":'("	    : ['😢', 'cry'],
	\ ":'-("    : ['😢', 'cry'],
	\ ":')"	    : ['😂', 'joy'],
	\ ":'-)"    : ['😂', 'joy'],
	\ '>:)'	    : ['😈', 'smiling_imp'],
	\ '>:-)'    : ['😈', 'smiling_imp'],
	\ '>:('     : ['👿', 'imp'],
	\ '>:-('    : ['👿', 'imp'],
	\ 'O:)'	    : ['😇', 'innocent'],
	\ 'O:-)'    : ['😇', 'innocent'],
	\ ':\|'	    : ['😑', 'expressionless'],
	\ ':-\|'    : ['😑', 'expressionless'],
	\ ':<'	    : ['😡', 'rage'],
	\ ':-<'	    : ['😡', 'rage'],
	\ ':/'	    : ['😒', 'unamused'],
	\ ':-/'	    : ['😒', 'unamused'],
	\ '\|O'	    : ['😴', 'sleeping'],
	\ '\|-O'    : ['😴', 'sleeping'],
	\ '8-/'	    : ['🙄', 'face_with_rolling_eyes'],
	\ '8/'	    : ['🙄', 'face_with_rolling_eyes'],
	\ ':X'	    : ['🤐', 'zipper_mouth_face'],
	\ ':-X'	    : ['🤐', 'zipper_mouth_face'],
\ }

" :joy: style abbreviations for git-hub emojis
for em in gh_emoji#list()
    try
	exec ':iab <buffer> :'.em.':' gh_emoji#for(em)
    catch
	" If _ is not a keyword char or if em is too long it produces an
	" error. Just ignore.
	"echomsg "Disabled illegal abbreviation" em gh_emoji#for(em)
    endtry
endfor
set omnifunc=gh_emoji#complete
