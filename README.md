# Akeneo PIM in Docker

[Akeneo PIM](http://akeneo.com/) is an open source [product information management](https://en.wikipedia.org/wiki/Product_information_management) system.

This repo contains three different images:

* `akeneo`: a fresh installation of Akeneo PIM, without database
* `akeneo-standalone`: an all-in-one image with Akeneo PIM and MySQL (:warning: currently not ready)
* `akeneo-edge`: experimental image with PHP7 (:warning: currently not ready)

The image is published at docker hub: [`pardahlman/akeneo](https://hub.docker.com/r/pardahlman/akeneo/). 

## Getting started

The easiest way to getting started is by creating a `docker-compose.yml` file [similar to the one in the repo](https://github.com/pardahlman/docker-akeneo/blob/master/docker-compose.yml)

```bash
> git clone https://github.com/pardahlman/docker-akeneo.git
> cd docker-akeneo
> docker-compose up
```

Open a browser and navigate to `localhost:8080` (or the port you've mapped on the host). Log in with the credentials `admin`/`admin`.