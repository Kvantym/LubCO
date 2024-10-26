FROM alpine:latest

RUN apk add --no-cache bash coreutils

COPY count_files.sh /usr/local/bin/count_files.sh

RUN chmod +x /usr/local/bin/count_files.sh

CMD ["/usr/local/bin/count_files.sh"]
