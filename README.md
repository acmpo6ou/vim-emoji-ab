## 🔥🔥🔥 Emoji Abbreviations in Vim 💻 🔥🔥🔥

This plugin enables emoji abbreviations in Vim❗Unicode emojis are now easy to
type 💥🎊🍷🍻🎇.

### Enabling

Run `:runtime macros/emojis.vim` to enable abbreviations in the current
buffer. To always enable it for certain file types add the following to your
`~/.vimrc`:

    au FileType html,php,markdown,mmd,text,mail
        \ runtime macros/emojis.vim

You need UTF-8 support to use this.

### Smiley style abbreviations

Typing `:)` into a buffer should produce "😄". The smileys defined in this
manner are:

* 😄 (smiley): `:)`, `:-)`
* 🙁 (slightly_frowning_face): `:(`, `:-(`
* 😉 (wink): `;)`, `;-)`
* 😊 (blush): `:$`, `:-$`
* 😁 (grin): `:D`, `:-D`
* 😳 (flushed): `8\|`, `8-\|`
* 😲 (astonished): `:O`, `:-O`
* 😲 (astonished): `8O`, `8-O`
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
* 😑 (expressionless): `:\|`, `:-\|`
* 😡 (rage): `:<`, `:-<`
* 😒 (unamused): `:/`, `:-/`
* 😴 (sleeping): `\|O`, `\|-O`
* 🙄 (face_with_rolling_eyes): `8-/`, `8/`
* 🤐 (zipper_mouth_face): `:X`, `:-X`

**NOTE:** Some of the above are not legal vim abbreviations. This depends on
what characters are keywords. The ones that are not legal abbreviations are
silently ignored.

### Git-hub / Discord style abbreviatons

Typing `:joy:` into a buffer should produce "😂". The huge (800+) list can be
found [here](https://gist.github.com/rxaviers/7360908). Completions are
enabled, so typing

    :ang<C-X><C-O>

should produce a list with previews.

### Helper functions

All functions from the [vim-emoji](https://github.com/junegunn/vim-emoji)
plugin are available. Just replace `emoji#` with `gh_emoji#`. The completion
code is directly taken from this plugin, but the data is replaced with git-hub
/ discord style names.

### Color emojis

You can get color emojis in vim (even on a terminal!) by installing the right
fonts. On Debian buster:

    apt install fonts-noto-color-emoji

makes things work on `gnome-termial` and `gvim`. To make things work under
`Konsole` (and also to get browsers to use the color emojis, and not the black
and white ones from the *Symbola* or *Dejavu* fonts, you might have to also
edit your `fonts.conf`:

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
