# runner
Github Runner Dockerfile

## Setup
```shell
$ chmox +x setup.sh
$ ./setup.sh
```

## Example
Start 4 runners

```shell
$ docker-compose build
$ docker-compose up --scale runner=4 -d
```
