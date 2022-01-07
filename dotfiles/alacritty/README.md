# Alacritty

### Terminal functionality unavailable in remote shells
When connecting to a remote system from an Alacritty terminal, for instance over SSH, it can occur that the system does not have an entry for Alacritty in its terminfo database (/usr/share/terminfo/a/alacritty*). Therefore, all interactive terminal functionality does not work. This can be fixed by explicitly exporting the value of the TERM variable set to xterm-256color instead of the default alacritty:

  `export TERM=xterm-256color`

or by setting the value of TERM in the configuration:

```bash
    env:
        TERM: xterm-256color
```

### TODOs
  - show how many search results were found? At the top right there is a result counter but that shows something else?
  - how to drag when none?
  - find a thinner font and disable use_thin_strokes?
  - bold and italic fonts monaco nerd fonts, or maybe for bold and italic just monaco will be fine
  - mouse won't work properly in vim, maybe because tmux or alacritty? Try 'set ttymouse=sgr' in vimrc