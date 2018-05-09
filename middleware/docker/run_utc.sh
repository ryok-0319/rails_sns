#!/bin/bash

ln -sf /usr/share/zoneinfo/UTC /etc/localtime && /usr/sbin/service ssh start && tail -f /dev/nulls
