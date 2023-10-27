#!/bin/bash

run() {
  exec=$1
  printf "\x1b[38;5;104m --> ${exec}\x1b[39m\n"
  eval ${exec}
}

say () {
  say=$1
  printf "\x1b[38;5;220m${say}\x1b[38;5;255m\n"
}

say "Installing repeater fan controller"
run "cp repeater-fancontroller /usr/sbin"
run "chmod a+x /usr/sbin/repeater-fancontroller"

say "Installing repeater pa controller"
run "cp repeater_pacontroller /usr/sbin/repeater_pacontroller"
run "chmod a+x /usr/sbin/repeater_pacontroller"

say "Installing repeater-fancontroller.service"
run "cp repeater-fancontroller.service /lib/systemd/system/repeater-fancontroller.service"

say "Installing systemd services"
run "systemctl enable repeater-fancontroller"
run "systemctl start repeater-fancontroller"







