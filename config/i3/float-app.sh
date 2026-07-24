#!/bin/bash

usage="$(basename "$0") [-h] [-s n] <application_name>

Launches a floating application, sleeps for the specified amount of time
(waiting for the focus to switch, then toggles the window's floating state

where:
    -h  show this help text
    -s  sleep time in seconds before floating the application (default: 1)"

sleep_time=1
while getopts ':hs:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    s)sleep_time=$OPTARG
       ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))

$1 &
sleep ${sleep_time}s
i3-msg "floating toggle"
