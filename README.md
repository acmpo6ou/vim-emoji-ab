## Emoji Abbreviations in Vim 🔥

This plugin enables emoji abbreviations in Vim, making Unicode emojis easy to
type. For instance typing `:)` produces 😄 (Unicode char 0x01f604),  or typing
`:boom:` produces 💥 (Unicode char 0x1f4a5).

### Enabling

Run `:runtime macros/emojis.vim` to enable abbreviations in the current
buffer. To always enable it for certain file types add the following to your
`~/.vimrc`:

    au FileType html,php,markdown,mmd,text,mail,gitcommit
        \ runtime macros/emoji-ab.vim

You need UTF-8 support to use this.

### Smiley style abbreviations

Typing `:)` into a buffer should produce "😄". The smileys defined in this
manner are:

* 😄 (smiley): `:)`, `:-)`
* 🙁 (slightly_frowning_face): `:(`, `:-(`
* 😉 (wink): `;)`, `;-)`
* 😊 (blush): `:$`, `:-$`
* 😁 (grin): `:D`, `:-D`
* 😳 (flushed): `8|`, `8-|`
* 😲 (astonished): `:O`, `:-O`, `8O`, `8-O`
* 😛 (stuck_out_tongue): `:P`, `:-P`
* 😜 (stuck_out_tongue_winking_eye): `;P`, `;-P`
* 😝 (stuck_out_tongue_closed_eyes): `XP`, `X-P`
* 😖 (confounded): `%)`, `%-)`
* 😕 (confused): `%/`, `%-/`
* 😎 (sunglasses): `8)`, `8-)`, `B)`, `B-)`
* 😢 (cry): `:`, `:'-(`
* 😂 (joy): `:`, `:'-)`
* 😈 (smiling_imp): `>:)`, `>:-)`
* 😇 (innocent): `O:)`, `O:-)`
* 😑 (expressionless): `:|`, `:-|`
* 😡 (rage): `:<`, `:-<`
* 😒 (unamused): `:/`, `:-/`
* 😴 (sleeping): `|O`, `|-O`
* 🙄 (face_with_rolling_eyes): `8-/`, `8/`
* 🤐 (zipper_mouth_face): `:X`, `:-X`

**NOTE:** Some of the above are not legal vim abbreviations. This depends on
what characters are keywords. The ones that are not legal abbreviations are
silently ignored.

### Gemoji abbreviatons

Typing `:joy:` into a buffer should produce "😂". A huge (800+) list of
standard emoji aliases can be found
[here](https://gist.github.com/rxaviers/7360908). In addition to this a few
extra completions (corresponding to emoji tags) are defined. The official
emoji tags are not unique, so duplicates are sequentially numbered. E.g.
`:happy:`, `:happy2:`, `:happy3:`, etc. (which produce 😀, 😄 and 😆
respectively). These can also be produced using the aliases `:smile:`,
`:laugh:`, `:laughing:` respectively. A list of all completions defined is in
[tests/emojis-of-tags.vim](tests/emojis-of-tags.vim). A list of tags for each emoji is in
[tests/tags-of-emojis.txt](tests/tags-of-emojis.txt) for searching.

Completions are enabled. Typing

    :ang<C-X><C-O>

should produce a list with previews.

### Advanced notes

#### Completion lists

The list of completions / emojis was generated automatically from `emoji.json`
taken from the [gemoji](https://github.com/github/gemoji) project using the
python script `tests/parse-emojis.py`. Here you can see that each emoji has
both aliases (which appear to be unique), and tags (which are not unique). We
define completions by combining these lists, and adding suffixes when tags are
not unique.


#### Helper functions

All functions from the [vim-emoji](https://github.com/junegunn/vim-emoji)
plugin are available. Just replace `emoji#` with `gh_emoji#`. The completion
code is directly taken from this plugin, but the data is replaced by the
gemoji tags / aliases.

### Color emojis

 

You can get color emojis in vim (even on a terminal 😱🤯💥) by installing the
right fonts. On Debian buster:

    apt install fonts-noto-color-emoji

makes things work on `gnome-termial` and `gvim`. To make things work under
`Konsole` (and also to get browsers to use the color emojis, and not the black
and white ones from the *Symbola* or *Dejavu* fonts, you might have to also
edit `~/.config/fontconfig/fonts.conf`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig> 
  <alias>
    <family>serif</family>
    <prefer>
      <family>Bitstream Vera Serif</family>
    </prefer>
  </alias>
  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Bitstream Vera Sans</family>
    </prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Hack</family>
    </prefer>
  </alias>

  <match target="pattern"> 
    <edit name="family" mode="prepend"> 
      <string>Noto Color Emoji</string> 
    </edit> 
  </match> 
</fontconfig>
```

This sets `Bistream Vera` as your default font. The reason for this is that it
has the same glyphs as the default `Dejavu` fonts, so you shouldn't notice the
difference. However it does **not** have any of the Unicode smileys. Thus the
color smileys from the *Noto Color Emoji* font should be used.
