#!/bin/bash

grep ttyS0 output/target/etc/inittab > /dev/null || (echo 'ttyS0::respawn:/sbin/getty -L  ttyS0 115200 vt100' >> output/target/etc/inittab)

sed -i '/^root:/{s/\/bin\/sh/\/bin\/zsh/g}' output/target/etc/passwd
sed -i 's/^#PermitRootLogin yes/PermitRootLogin without-password/g' output/target/etc/ssh/sshd_config

test -e output/target/usr/share/terminfo/x/xterm-256color || ln -s xterm-color output/target/usr/share/terminfo/x/xterm-256color





