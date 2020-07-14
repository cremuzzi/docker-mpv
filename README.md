# mpv

```sh
docker run --rm \
    --device /dev/dri \
    --network host \
    --shm-size 2g \
    -e DISPLAY=$DISPLAY \
    -v /etc/machine-id:/etc/machine-id:ro \
    -v /run/user/1000/pulse:/run/user/1000/pulse \
    -v $HOME/.Xauthority:/home/mpv/.Xauthority \
    mpv
```
