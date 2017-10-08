FROM ubuntu:xenial

RUN apt-get update \
        && apt-get install -y software-properties-common \
        && add-apt-repository ppa:duplicity-team/ppa \
        && apt-get update \
        && apt-get install -y duplicity python-pip \
        && pip install boto \
        && rm -rf /var/apt/lists/*

ADD https://raw.githubusercontent.com/zertrin/duplicity-backup.sh/stable/duplicity-backup.sh /usr/local/bin
COPY config/duplicity-backup.conf /etc/duplicity-backup.conf
RUN chmod +x /usr/local/bin/duplicity-backup.sh

ENTRYPOINT [ "duplicity-backup.sh", "-c", "/etc/duplicity-backup.conf" ]