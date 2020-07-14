FROM alpine:3.12

RUN apk add --no-cache \
        mesa-demos \
        mesa-dri-intel \
        mpv \
        pulseaudio \
        ttf-dejavu \
     && adduser -u 1000 -D mpv \
     && mkdir -p /home/mpv/.config/pulse \
     && echo "default-server = unix:/run/user/1000/pulse/native" > /home/mpv/.config/pulse/client.conf \
     && echo "autospawn = no" >> /home/mpv/.config/pulse/client.conf \
     && echo "daemon-binary = /bin/true" >> /home/mpv/.config/pulse/client.conf \
     && echo "enable-shm = false" >> /home/mpv/.config/pulse/client.conf \
     && chown -R mpv:mpv /home/mpv

USER mpv

WORKDIR /home/mpv

CMD ["mpv"]
