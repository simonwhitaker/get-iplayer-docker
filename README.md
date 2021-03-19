# About

This repo contains a Dockerfile that builds an image with
[get_iplayer](https://github.com/get-iplayer/get_iplayer) installed and ready to
use.

# Build

```
docker build -t get_iplayer .
```

# Usage

```
docker run --rm get_iplayer
```

Output is to /output in the container. Map that to a local volume to download to
your local filesystem.

```
docker run --rm -v $PWD:/output get_iplayer https://www.bbc.co.uk/programmes/b07hfwrr
```
