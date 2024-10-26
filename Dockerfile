
FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y findutils && \
    apt-get clean

    COPY count_files.sh /usr/local/bin/count_files.sh



RUN chmod +x /usr/local/bin/count_files.sh

WORKDIR /etc

CMD ["/usr/local/bin/count_files.sh"]
