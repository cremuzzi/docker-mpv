# How to use this image

## Start an MPV instance

```sh
docker run --rm -i -t \
    --device /dev/dri \
    --network host \
    -e DISPLAY \
    -e XDG_RUNTIME_DIR \
    -v /etc/machine-id:/etc/machine-id:ro \
    -v /run/user/1000/pulse:/run/user/1000/pulse \
    -v $HOME/.Xauthority:/home/mpv/.Xauthority \
    -v /path/to/your/media/:/home/mpv/media:ro \
    cremuzzi/mpv
```

where `/path/to/your/media` is the path on your host with the media files you want to play.

The command above will leave you with an interactive terminal inside the working directory `/home/mpv/media` of the container.

Once you are there, you can just explore the folder and play the media file that you need.

Please notice in the example above that we are mounting a few volumes that allow your container to
connect as a client to your host's pulseaudio and Xorg server.

## yt-dl

This image comes with **yt-dl** installed.
You can play yt-dl supported content via
running this image with command `mpv https://media/url/`.

Eg.:

```sh
docker run --rm -i -t \
    --device /dev/dri \
    --network host \
    -e DISPLAY \
    -v /etc/machine-id:/etc/machine-id:ro \
    -v /run/user/1000/pulse:/run/user/1000/pulse \
    -v $HOME/.Xauthority:/home/mpv/.Xauthority \
    cremuzzi/mpv mpv https://media/url/
```

As long as your media url is retrievable by yt-dl then mpv should take care of reproducing it.

## Further reading

For a complete guide on the usage of MPV please visit the official page at [mpv.io/manual/stable/](https://mpv.io/manual/stable/).
