#!/bin/sh
set -eu
acpi_listen | while IFS= read -r event; do
  set -- $event
  ~/.scripts/event_handler.sh "$@" || logger -t event_handler "fail: $event"
done
