FROM python:3.6.4-alpine3.7

ARG REPOSITORY="https://github.com/dashpay/sentinel.git"
ARG BRANCH="master"
ARG CONFIG_PATH="/sentinel/.dashcore/dash.conf"
ARG USER="sentinel"

ENV SENTINEL_DEBUG=1 \
    LC_ALL="C" \
    REPOSITORY=$REPOSITORY \
    BRANCH=$BRANCH \
    CONFIG_PATH=$CONFIG_PATH \
    USER=$USER

RUN apk --update add --virtual build-dependencies git \
&&  addgroup -g 1000 -S $USER \
&&  adduser -u 1000 -S $USER -G $USER -h /sentinel

WORKDIR /sentinel

COPY ./conf/dash.conf $CONFIG_PATH

RUN git init \
&&  git remote add origin $REPOSITORY \
&&  git fetch origin $BRANCH \
&&  git checkout -t origin/$BRANCH \
&&  mkdir -p database conf .local \
&&  chmod -R 777 database \
&&  echo -e "dash_conf=${CONFIG_PATH}\ndb_name=database/sentinel.db" > /sentinel/sentinel.conf \
&&  pip install -r requirements.txt \
&&  apk del build-dependencies \
&&  chown -R $USER:$USER /sentinel

USER $USER

ENTRYPOINT ["python", "bin/sentinel.py"]
