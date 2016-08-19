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

```sh
# Clean all files in current directory and import
docker run -u "$(id -u):$(id -g)" -v $(pwd):/import -v $HOME/.config/beets:/config -v $HOME/music:/music --rm docker-beets
```

If you'd like to run interactively (useful for albums that do not match automatically):

```sh
docker run -u "$(id -u):$(id -g)" -v $(pwd):/import -v $HOME/.config/beets:/config -v $HOME/music:/music --rm --it docker-beets clean-and-import
```

Or maybe you just want to list out your albums in reverse chronological order:

```sh
docker run -u "$(id -u):$(id -g)" -v $(pwd):/import -v $HOME/.config/beets:/config -v $HOME/music:/music --rm --it docker-beets beet ls -a year-
```
