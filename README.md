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

## youtube-dl

The image comes with **youtube-dl** as well. So you can play YT content directly like this:

```sh
docker run --rm -i -t \
    --device /dev/dri \
    --network host \
    -e DISPLAY \
    -v /etc/machine-id:/etc/machine-id:ro \
    -v /run/user/1000/pulse:/run/user/1000/pulse \
    -v $HOME/.Xauthority:/home/mpv/.Xauthority \
    cremuzzi/mpv mpv http://youtube.com/watch?v=yt-video-id
```

The difference here is that we are not mounting any media folder from the host.
In this example we are running a container with the custom command "mpv yt-video-url", then mpv will take care of everything for you.

## Further reading

For a complete guide on the usage of MPV please visit the official page at [mpv.io/manual/stable/](https://mpv.io/manual/stable/).
