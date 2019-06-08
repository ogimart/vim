# my tmux config

My minimal tmux config.
Do not use any plugins and keep original key bindings.

## cheat sheet

### tmux cli

```
tmux ls
tmux new -s session-name
tmux attach -t [session-name]
tmux kill-session -t session-name
```

### prefix

```
CTRL-b
```

### sessions

| Cmd | Description |
| -- | -- |
| :new | New session |
| d | Detach from session |
| s | List sessions |
| ) | Next session |
| ( | Previous session |
| $ | Rename session |
| L | Last session |

### panes

| Cmd | Description |
| -- | -- |
| % | Split the window vertically |
| " | Split window horizontally |
| o | Goto next pane |
| ; | Goto last pane |
| q | Show pane numbers |
| { | Move the current pane left |
| } | Move the current pane right |
| ! | Break pane, make a pane its own window |
| x | Kill current pane |

### windows

| Cmd | Description |
| -- | -- |
| c | Create new window |
| , | Rename the current window |
| n | Move to the next window |
| p | Move to the previous window |
| l | Move to the previously selected window |
| w | List all windows |
| & | Kill window |
| {n} | move to the specified window number |

### copy mode (vi)

| Cmd | Description |
| -- | -- |
| [ | Start copy mode |
| ] | Paste from copy mode |
| s |pace Start selection |
| e |nter Copy selection |

### help

| Cmd | Description |
| -- | -- |
| ? | List all keybinding |
