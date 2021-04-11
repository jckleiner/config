# bspwm

### Installation

- `sudo apt install bspwm` (also installs `sxhkd` in Ubutuntu)
- `mkdir ~/.config/bspwm && mkdir ~/.config/sxhkd`
- `cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/ && cp /usr/share/doc/bspwm/examples/sxhkdrc ~/.config/sxhkd/`
- The default terminal emunlator in the example config is `urxvt`, so edit the config `nano ~/.config/sxhkd/sxhkdrc` and change the default terminal to something you have installed on your system.
- logout and change your window manager

### Tips and Tricks

I've been using it for more than two years now and here are some recommendations:

1. Learn how to use the bspc tool, the man page is your best friend. Learn about selectors (NODE_SEL, DESKTOP_SEL, MONITOR_SEL) and domains (node, desktop, monitor).

2. Watch out for the return value of some bspc commands, you can make interesting conditionals just using the shell's "&&".

3. This is not a rule, just something to be careful about and that it took me a long time to notice: just because you can make any layout, it doesn't mean you should. BSPWM is limited to the binary tree, if you start drastically resizing or rotating nodes, you will lose the visual reference of the tree. For example, if you have 3 windows in vertical split using the same space, eventually you will forget if the window on the side is the brother or nephew, then if you close the window you don't know each one will fill the space of the closed window. Just don't completely ignore the tree.

4. About the master/stack layout. Yes, you can probably do it, but it might not be a good idea because of recommendation (3). What I like to do is to leave one window using one half of the screen, and opening all of the others in the other half (making a grid, spiral, whatever). Then you can, for example, create bindings to swap the node with the master. This won't be like the master/stack layout but it will be bspwm friendly.

5. Most people say that BSPWM has permanent desktops, but that's not true. They're very dynamic: you can add, remove, rename, move, swap, etc.

6. I don't know if you notice yet, but you have different automatic_scheme, so check them out.

### TODOs
  - bspwm (and sxhkd), polybar, dmenu install/config
  - https://dev.to/jdeepd/bspwm-installation-on-ubuntu-20-04-updated-2021-3kip