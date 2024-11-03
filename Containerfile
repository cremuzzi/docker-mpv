FROM alpine:3.20

LABEL maintainer="Carlos Remuzzi <carlosremuzzi@gmail.com>"
LABEL org.label-schema.description="Containerization of mpv.io"
LABEL org.label-schema.name="mpv"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.vcs-url="https://github.com/cremuzzi/docker-mpv"

ARG YTDL_VERSION=2024.08.07

RUN apk add --no-cache \
    ffmpeg \
    mesa-dri-gallium \
    mpv \
    pulseaudio \
    python3 \
    ttf-dejavu \
  && wget https://github.com/ytdl-org/ytdl-nightly/releases/download/${YTDL_VERSION}/youtube-dl \
          -O /usr/local/bin/youtube-dl \
  && chmod 0755 /usr/local/bin/youtube-dl \
  && echo "UP add volume +2" > /etc/mpv/input.conf \
  && echo "DOWN add volume -2" >> /etc/mpv/input.conf \
  && adduser -u 1000 -D mpv

USER mpv

WORKDIR /home/mpv/

CMD ["/bin/ash"]
