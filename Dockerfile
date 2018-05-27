FROM    node:10-alpine as dev
RUN     npm install -g browser-sync


FROM    alpine:3.7 as prod
RUN     apk add --no-cache lighttpd
COPY    index.html /files/
COPY    worker.js /files/
COPY    bower_components /files/bower_components
COPY    js /files/js

COPY    entry.sh /opt/
COPY    lighttpd.conf /opt/
WORKDIR /opt
CMD     ["/opt/entry.sh"]
