#!/bin/bash

disable_freevxfs() {
    if [[ "$(modprobe -n -v freevxfs 2>/dev/null)" == *install* ]]; then
        echo "Passed"
    else
        echo -e "Failed"
    fi

}

disable_freevxfs
