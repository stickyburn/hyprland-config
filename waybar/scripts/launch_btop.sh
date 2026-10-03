#!/bin/bash

pgrep -x btop >/dev/null && exit 0
exec kitty btop
