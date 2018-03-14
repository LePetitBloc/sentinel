FROM python:3.6.4-alpine3.7

ENV SENTINEL_DEBUG=1 \
    SENTINEL_CONFIG="/sentinel/conf/sentinel.conf" \
    LC_ALL="C"

RUN apk --update add --virtual build-dependencies \
    git \
&&  git clone --single-branch --branch develop https://github.com/dashpay/sentinel.git /sentinel

WORKDIR /sentinel

RUN pip install -r requirements.txt \
&& apk del build-dependencies

COPY ./conf/sentinel.conf $SENTINEL_CONFIG
COPY ./conf/dash.conf /root/.dashcore/dash.conf

ENTRYPOINT ["python", "bin/sentinel.py"]
