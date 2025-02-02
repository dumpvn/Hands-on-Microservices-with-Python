# FROM python:3-alpine
FROM python:3.7-alpine3.15

LABEL MAINTAINER="Peter Fisher"

COPY ./app/requirements.txt /app/requirements.txt

WORKDIR /app

RUN apk add --update \
  && pip install --upgrade pip  \
  && pip install -r requirements.txt \
  && rm -rf /var/cache/apk/*

COPY ./app /app

CMD python app.py run -h 0.0.0.0
