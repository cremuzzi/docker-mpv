FROM alpine:3.18.4

LABEL maintainer="niawag <niawag.flexget@gmail.com>"
LABEL org.label-schema.description="Containerization of mpv.io"
LABEL org.label-schema.name="mpv"
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.vcs-url="https://github.com/niawag/docker-mpv"

RUN apk add --no-cache \
    ffmpeg \
    mpv \
    pulseaudio \
    python3 \
  && ln -s python3 /usr/bin/python \
  && adduser -u 1000 -D mpv \
  && mkdir -p /home/mpv/ \  
  && mkdir -p /data/ \
  && mkdir -p /home/mpv/.config/pulse \
  && echo "default-server = unix:/run/user/1000/pulse/native" > /home/mpv/.config/pulse/client.conf \
  && echo "autospawn = no" >> /home/mpv/.config/pulse/client.conf \
  && echo "daemon-binary = /bin/true" >> /home/mpv/.config/pulse/client.conf \
  && echo "enable-shm = false" >> /home/mpv/.config/pulse/client.conf \
  && mkdir -p /home/mpv/.config/mpv \
  && chown -R mpv:mpv /home/mpv

USER mpv

WORKDIR /home/mpv/

VOLUME ["/data"]

CMD ["ash"]
