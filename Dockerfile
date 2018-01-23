FROM debian:jessie

ENV SENTINEL_DEBUG 1
ENV SENTINEL_CONFIG "/sentinel/conf/sentinel.conf"

RUN apt-get update -y \
	&& apt-get install -y \
	build-essential \
	virtualenv \
	python \
	python-dev \
	python-virtualenv \
	git

RUN cd / \
	&& git clone https://github.com/sparkscrypto/sentinel.git \
	&& cd sentinel \
	&& export LC_ALL=C \
	&& virtualenv ./venv \
	&& ./venv/bin/pip install -r requirements.txt

COPY ./conf/sentinel.conf $SENTINEL_CONFIG
COPY ./conf/sparks.conf /sentinel/conf/sparks.conf

WORKDIR /sentinel

CMD ["./venv/bin/python", "bin/sentinel.py"]
