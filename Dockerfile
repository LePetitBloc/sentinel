FROM python:3.6.4-alpine3.7

ARG REPOSITORY="https://github.com/dashpay/sentinel.git"

ENV SENTINEL_DEBUG=1 \
    SENTINEL_CONFIG="/sentinel/conf/sentinel.conf" \
    LC_ALL="C" \
    REPOSITORY=$REPOSITORY

RUN apk --update add --virtual build-dependencies \
    git \
&&  git clone --single-branch --branch develop $REPOSITORY /sentinel

WORKDIR /sentinel

RUN pip install -r requirements.txt \
&& apk del build-dependencies

COPY ./conf/sentinel.conf $SENTINEL_CONFIG
COPY ./conf/dash.conf /root/.dashcore/dash.conf

ENTRYPOINT ["python", "bin/sentinel.py"]
