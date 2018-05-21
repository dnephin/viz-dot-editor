FROM    alpine:3.7 as dev
RUN     apk add --no-cache lighttpd

FROM    dev
COPY    index.html /files/
COPY    worker.js /files/
COPY    bower_components /files/bower_components
COPY    js /files/js

COPY    entry.sh /opt/
COPY    lighttpd.conf /opt/
WORKDIR /opt
CMD     ["/opt/entry.sh"]
