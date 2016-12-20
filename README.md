# Beets + mp3val + bs1770gain

`mp3val`, `bs1770gain`, and `beets` in a container for easy music organization from your favorite mixtape sites.

The big difference between this and other containers for beets is that you can run `mp3val` on the files beforehand and actually calculate gain info. Most people probably don't care though.

## Build from Dockerfile

```sh
git clone https://github.com/fortes/docker-beets
cd docker-beets
docker -t build docker-beets .
```

## Docker run example

Clean all files in current directory and import:

```sh
docker run --rm \
  -u "$(id -u):$(id -g)" \
  -v $(pwd):/import \
  -v $HOME/.config/beets:/config \
  -v $HOME/music:/music \
  fortesdotcom/docker-beets \
  clean-and-import -q
```

If you'd like to run interactively (useful for albums that do not match automatically):

```sh
docker run --rm -it \
  -u "$(id -u):$(id -g)" \
  -v $(pwd):/import \
  -v $HOME/.config/beets:/config \
  -v $HOME/music:/music \
  fortesdotcom/docker-beets \
  clean-and-import
```

Or maybe you just want to list out your albums in reverse chronological order:

```sh
docker run --rm -it \
  -u "$(id -u):$(id -g)" \
  -v $(pwd):/import \
  -v $HOME/.config/beets:/config \
  -v $HOME/music:/music \
  fortesdotcom/docker-beets \
  beet ls -a year-
```

# Changelog

* 2016-12-20: Move to Debian Jessie. `clean-and-import` no longer default command.
* 2016-08-19: First release.
