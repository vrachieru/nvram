#!/bin/sh

show_help() {
        echo "usage:"
        echo "$0 -on         Turn leds on"
        echo "$0 -off        Turn leds off"
        echo ""
}

case ${1} in
    -on)
        nvram set led_disable=0
        service restart_leds
        echo "Leds are now on"
        logger -s -t leds "on"
        ;;

    -off)
        nvram set led_disable=1
        service restart_leds
        echo "Leds are now off"
        logger -s -t leds "off"
        ;;

    *)
        show_help
        exit 1
        ;;
esac