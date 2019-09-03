#!/bin/sh

set -e

[ -z $1 ] && exit 1

USERNAME=egor
USERPATH=/home/$USERNAME/gen/servers/localhost/arch/
ABSPATH=`realpath $1` 

rsync --delete --info=progress2 -Rlav --chown $USERNAME:$USERNAME $ABSPATH $USERPATH
chown -R $USERNAME:$USERNAME $USERPATH
exit 0