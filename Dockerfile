FROM python:3.8-buster

WORKDIR /piptmp

RUN apt-get update \
    && apt-get install -y vim
RUN pip install pipenv
RUN export SHELL='/bin/bash'

ENV VIRTUAL_ENV /bin/env
RUN mkdir -p /bin/env

COPY Pipfile* ./

RUN pipenv install --dev

WORKDIR /usr/src/api

ENTRYPOINT ./dev-entrypoint.sh
