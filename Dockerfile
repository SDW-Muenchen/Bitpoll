# syntax=docker/dockerfile:1
FROM python:3.8

RUN apt-get update && apt-get install default-libmysqlclient-dev build-essential -y

# first, only copy all production requirements
COPY ./requirements-production.txt /app/requirements.txt
WORKDIR /app

# install all requirements
RUN pip install -r /app/requirements.txt

# copy all required files and start application (uwsgi)
COPY ./ /app/
CMD bash ./start.sh
