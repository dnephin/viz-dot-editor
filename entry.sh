#!/usr/bin/env sh

ip addr show | grep -Eo 'inet [^/]+' | \
  awk '{print "Listening on http://" $2 ":80"}'
exec lighttpd -f lighttpd.conf -D
