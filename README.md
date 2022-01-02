# Beets + mp3val

`mp3val` and `beets` in a container for easy music organization from your favorite mixtape sites.

The big difference between this and other containers for beets is that you can run `mp3val` on the files beforehand and actually calculate gain info. Most people probably don't care though.

## Build from Dockerfile

```sh
git clone https://github.com/fortes/docker-beets
cd docker-beets
docker build -t docker-beets .
```

## Start Container

Start beets web interface and leave it running:

```sh
docker create \
  --name=beets \
  -p 8337:8337 \
  -v $HOME/.config/beets:/config \
  -v $HOME/downloads:/import \
  -v $HOME/music:/music \
  --restart=unless-stopped \
  fortesdotcom/docker-beets
```

## Docker run example

Clean all files in current directory and import:

```sh
docker exec -u "$(id -u):$(id -g)" -it beets \
  clean-and-import -q
```

If you'd like to run interactively (useful for albums that do not match automatically):

```sh
docker exec -u "$(id -u):$(id -g)" -it beets \
  clean-and-import
```

Or maybe you just want to list out your albums in reverse chronological order:

```sh
docker exec -u "$(id -u):$(id -g)" -it beets \
  beet ls -a year-
```

# Changelog

* 2022-01-01: Beets 1.6.0, build on Debian Bullseye, remove deprecated bs1700gain
* 2021-01-19: Beets 1.4.9, build on Debian Buster
* 2019-05-17: Beets 1.4.8
* 2018-08-21: Add `beets-pitchfork` plugin
* 2018-08-10: Bunch of stuff:
  * `beet web` is now default command, usage instructions completely changed
  * Use Python 3
  * Add ImageMagick for album art resizing.
  * Expose port `8337` for web
* 2016-12-20: Move to Debian Jessie. `clean-and-import` no longer default command.
* 2016-08-19: First release.
