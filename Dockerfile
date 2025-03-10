# syntax=docker/dockerfile:1
FROM python:3.12

RUN pip install --upgrade pip
RUN pip install setuptools


RUN apt-get update && apt-get install default-libmysqlclient-dev build-essential gettext uwsgi-plugin-python3 libldap2-dev libsasl2-dev -y

# Add a label indicating Django 5
LABEL django_version="5.0"

# first, only copy all production requirements
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app

# install all requirements
RUN pip install -r /app/requirements.txt

# copy all required files and start application (uwsgi)
COPY ./ /app/
CMD bash ./start.sh
