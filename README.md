# Civic-19 in Japan app

This app allow us to watch civic-19 situation in Japan.
Here is a [demo](https://civic-19-in-japan.herokuapp.com/)!

# To get started in your local environment

## build docker image

```bash
docker-compose build
```

## run containers by docker-compose

```bash
docker-compose up
```

## create database

```bash
docker-compose run web rake db:create
```

That's all!

# To run rails command

You can run command in your container like ssh.

```bash
docker-compose run web bash
```

and then, you can execute command in your web container.

or you can execute command like below.

```bash
docker-compose run web [command whatever you want]
```
