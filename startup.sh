#!/bin/bash

USER=nova vncserver :1 -geometry 1280x800 -depth 24 -localhost no

tail -f /dev/null

