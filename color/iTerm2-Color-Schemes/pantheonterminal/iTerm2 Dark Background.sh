#!/bin/bash
dconf load /org/pantheon/terminal/settings/ <<COLORS
[/]
name='iTerm2 Dark Background'
cursor-color='#c7c7c7'
foreground='#c7c7c7'
background='rgba(0,0,0,.95)'
palette='#000000:#c91b00:#00c200:#c7c400:#0225c7:#ca30c7:#00c5c7:#c7c7c7:#686868:#ff6e67:#5ffa68:#fffc67:#6871ff:#ff77ff:#60fdff:#ffffff'
COLORS
