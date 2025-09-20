#!/bin/sh
case $1 in
  # only usefull for laptops
  # /etc/systemd/logind.conf: HandleLidSwitch=ignore
  button/lid)
    case $3 in
      close)
        [ ! -f /tmp/desktop_mode.tmp ] && \
        LID_STATE=$(cat /proc/acpi/button/lid/*/state | awk '{print $2}') && \
        [ "$LID_STATE" = "closed" ] && \
        lock.sh & sleep 5 && \
        LID_STATE_AGAIN=$(cat /proc/acpi/button/lid/*/state | awk '{print $2}') && \
        [ "$LID_STATE_AGAIN" = "closed" ] && \
        BATTERY_STATE=$(upower -i /org/freedesktop/UPower/devices/battery_BAT1 | awk '/state/ {print $NF}') && \
        [ "$BATTERY_STATE" = "discharging" ] && \
        doas systemctl hibernate

        ;;
    esac
    ;;
esac

