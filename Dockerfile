FROM python:3.6.4-alpine3.7

ARG REPOSITORY="https://github.com/dashpay/sentinel.git"
ARG CONFIG_PATH="/root/.dashcore/dash.conf"

ENV SENTINEL_DEBUG=1 \
    LC_ALL="C" \
    REPOSITORY=$REPOSITORY \
    CONFIG_PATH=$CONFIG_PATH

RUN apk --update add --virtual build-dependencies \
    git \
&&  git clone --depth 1 $REPOSITORY /sentinel

WORKDIR /sentinel

COPY ./conf/sentinel.conf /sentinel/conf/sentinel.conf
COPY ./conf/dash.conf $CONFIG_PATH

RUN echo "dash_conf=${CONFIG_PATH}" > /sentinel/conf/sentinel.conf \
&& pip install -r requirements.txt \
&& apk del build-dependencies

ENTRYPOINT ["python", "bin/sentinel.py"]
