#!/usr/bin/env bash

VERSION=latest
# VERSION=dev

if [[ -e "/dev/ttyUSB0" ]]
then
    EXTRA_ARGS="--device /dev/ttyUSB0"
fi

case "$@" in
    *" dashboard"*)
        EXTRA_ARGS="$EXTRA_ARGS -p 6052:6052 -p 6123:6123"
        ;;
    *" run"*|*" upload"*)
        EXTRA_ARGS="$EXTRA_ARGS -p 6123:6123"
        ;;
esac

docker run --rm -it \
    -v "$PWD":/config \
    $EXTRA_ARGS \
    "ottowinter/esphomeyaml:$VERSION" "$@"
