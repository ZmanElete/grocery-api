
FROM python:3.12.1-bullseye

# Force stin, stdout, and stderr to be totally unbuffered
ENV PYTHONUNBUFFERED 1
ENV POETRY_VERSION 1.7.1

# install system dependencies
RUN apt-get update
RUN apt-get install -y \
    locales \
    postgresql-client \
    curl \
    nginx \
    nano \
    vim \
    acl

# system locale
ENV LANG = en_US.UTF-8 \
LANGUAGE = en_US:en \
LC_ALL   = en_US.UTF-8

# configure locale
RUN sed -i -e 's/# \(en_US\.UTF-8 .*\)/\1/' /etc/locale.gen && locale-gen

RUN pip install --no-cache-dir --upgrade pip wheel
RUN pip install "poetry==$POETRY_VERSION"

# cleanup
RUN rm -rf /var/lib/apt/lists

WORKDIR /app/

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false
RUN poetry install --no-interaction --no-root

# python setup
RUN pip install --upgrade pip wheel pipenv
RUN pip install poetry

COPY ./docker/docker-entrypoint.API.sh /docker-entrypoint.API.sh
RUN chmod +x /docker-entrypoint.API.sh

RUN echo "alias ll='ls -alF'" >> ~/.bashrc
RUN echo "alias rs='python manage.py runserver 0:8000'" >> ~/.bashrc
RUN echo "alias test='python manage.py test'" >> ~/.bashrc
RUN echo 'test' >> ~/.bashrc
RUN echo 'rs' >> ~/.bashrc

EXPOSE 8000
COPY . .

RUN git config --global --add safe.directory /app

CMD [ "/docker-entrypoint.API.sh" ]