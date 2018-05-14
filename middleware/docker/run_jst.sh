#!/bin/bash

ln -sf /usr/share/zoneinfo/Japan /etc/localtime && /usr/sbin/service ssh start && tail -f /dev/null
