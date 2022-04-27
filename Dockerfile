FROM python:3.8

# system environment
ENV PYTHONUNBUFFERED=1 \
    PROJECT_ROOT=/opt/api \
    PROJECT_DIR=/opt/api \
    VIRTUAL_ENV=/opt/api/api_py38 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    PIPENV_VERBOSITY=-1 \
    PATH="/opt/api/api_py38/bin:$PATH"

# install system dependencies
RUN apt-get update \
    && apt-get install -y \
    locales \
    vim

RUN apt clean

# configure locale
RUN sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen \
    && locale-gen

# python setup
RUN pip install --upgrade pip wheel pipenv

# project skeleton
RUN mkdir -p $PROJECT_ROOT/api/docker_bootstrap \
    && mkdir -p $VIRTUAL_ENV

# shell preferences
RUN ( \
    export SHELL='/bin/bash' \
    && echo 'alias ll="ls -alF"' >> ~/.bashrc \
    )

RUN echo 'history -s "./manage.py migrate"' >> ~/.bashrc
RUN echo 'history -s "./manage.py runserver 0:8000"' >> ~/.bashrc

WORKDIR /opt/app/api

ENTRYPOINT docker_bootstrap/mkvirtualenv && docker_bootstrap/start
