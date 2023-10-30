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

say "Installing repeater oled controller"
run "cp repeater-oledcontroller /usr/sbin"
run "chmod a+x /usr/sbin/repeater-oledcontroller"

say "Installing repeater pa controller"
run "cp repeater-pacontroller /usr/sbin/repeater-pacontroller"
run "chmod a+x /usr/sbin/repeater-pacontroller"

say "Installing repeater-fancontroller.service"
run "cp repeater-fancontroller.service /lib/systemd/system/repeater-fancontroller.service"

say "Installing systemd services"
run "systemctl enable repeater-fancontroller"
run "systemctl start repeater-fancontroller"

say "Installing repeater-oledcontroller.service"
run "cp repeater-oledcontroller.service /lib/systemd/system/repeater-oledcontroller.service"

say "Installing systemd services"
run "systemctl enable repeater-oledcontroller"
run "systemctl start repeater-oledcontroller"







