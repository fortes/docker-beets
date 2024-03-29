FROM debian:bullseye

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    python3-pip python3-setuptools mp3val ffmpeg imagemagick && \
  pip3 install -U wheel beautifulsoup4 beets flask pyacoustid pylast \
    requests beets-pitchfork lxml && \
  rm -rf /var/lib/apt/lists/*

VOLUME /config /import /music

ENV BEETSDIR /config

WORKDIR /import

COPY ./clean-and-import.sh /usr/bin/clean-and-import

EXPOSE 8337

CMD ["beet", "web"]
