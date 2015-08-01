#!/bin/bash

echo "006 - Fix 'stdin: is not a tty' bug"
echo "---"

# This is a fix for the "stdin: is not a tty"
# error that crops up every now and while
# provisioning vagrant.
#
# The Fix:
# --------
# A tty is historically the name of a physical
# point where you attach your terminal. Now,
# it is essentially the name of the terminal
# that is connected to standard input.
#
# The error crops up when a program tries to
# access the tty to run some command, but
# discovers that it's standard output is
# actually being piped to the standard input
# of some other program.
#
# That's when your current session complains
# that stdin is not a tty to be messed with.
#
# The solution is fairly straightforward. There
# is a UNIX program called 'mesg' which helps
# you control write access to your terminal
# (tty).
#
# When you run 'mesg n', it prevents programs
# from trying to write to your terminal in the
# first place, and hence they won't try to
# write to the stdin of another program when
# their output is piped. But you only want this
# when you're not using an interactive shell.
#
#
# - Vidur
#
#
# Sources:
#  - http://askubuntu.com/a/27444/263681
#  - http://askubuntu.com/a/66198
#
# ---
#
# Place this in the bashrc - which is run for
# interactive non-login shells
#

# Replaces the line:
# 'mesg n'
# with:
# 'tty -s && mesg n'
#
sed -i "s/^mesg n$/tty -s \\&\\& mesg n/g" /root/.profile && echo "Ignore above stdin error. Fixed from here on out."
