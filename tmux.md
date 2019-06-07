# my tmux

## tmux cheat sheet

tmux ls
tmux new -s session-name
tmux attach -t [session-name]
tmux kill-session -t session-name

### prefix

ctrl-b

### sessions

:new New session
d Detach from session
s List sessions
) Next session
( Previous session
$ Rename session
L Last session

### panes

% Split the window vertically
" Split window horizontally
o Goto next pane
; Goto last pane
q Show pane numbers, when the numbers show up type the key to go to that pane
{ Move the current pane left
} Move the current pane right
! Break pane, make a pane its own window
x Kill current pane

### windows

c Create new window
, Rename the current window
n Move to the next window
p Move to the previous window
l Move to the previously selected window
w List all windows
& Kill window
{n} move to the specified window number

### copy mode (vi)

[ Start copy mode
] Paste from copy mode
space Start selection
enter Copy selection

### help

? List all keybinding
