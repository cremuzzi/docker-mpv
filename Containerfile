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
  && adduser -u 1000 -D mpv \
  && mkdir -p /home/mpv/.config/pulse \
  && echo "default-server = unix:/run/user/1000/pulse/native" > /home/mpv/.config/pulse/client.conf \
  && echo "autospawn = no" >> /home/mpv/.config/pulse/client.conf \
  && echo "daemon-binary = /bin/true" >> /home/mpv/.config/pulse/client.conf \
  && echo "enable-shm = false" >> /home/mpv/.config/pulse/client.conf \
  && mkdir -p /home/mpv/.config/mpv \
  && echo "UP add volume +2" > /home/mpv/.config/mpv/input.conf \
  && echo "DOWN add volume -2" >> /home/mpv/.config/mpv/input.conf \
  && chown -R mpv:mpv /home/mpv

USER mpv

WORKDIR /home/mpv/

CMD ["/bin/ash"]
