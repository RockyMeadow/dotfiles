#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

#Ibus fix
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export QT4_IM_MODULE=ibus
export XMODIFIERS="@im=ibus"
ibus-daemon -drx


xrdb -merge ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

exec i3 -c $HOME/.i3/config
