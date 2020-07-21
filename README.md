# How to use this image

## Start an MPV instance

```sh
docker run --rm -i -t \
    --device /dev/dri \
    --network host \
    --shm-size 2g \
    -e DISPLAY=$DISPLAY \
    -v /etc/machine-id:/etc/machine-id:ro \
    -v /run/user/1000/pulse:/run/user/1000/pulse \
    -v $HOME/.Xauthority:/home/mpv/.Xauthority \
    -v /path/to/your/media/:/home/mpv/media:ro \
    mpv
```

where `/path/to/your/media` is the directory of the media files that you want to play.
