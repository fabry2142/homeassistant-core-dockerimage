FROM python:3.9-alpine

RUN apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    jpeg-dev \
    zlib-dev \
    bluez \
    make \
    libxml2-dev \
    libxslt-dev \
    build-base \
    cython

RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir homeassistant

FROM ghcr.io/home-assistant/home-assistant:stable

WORKDIR /usr/src/app

COPY . .

EXPOSE 8123

CMD [ "hass", "-c", "/config" ]