# REL: Radboud Entity Linker

This is a fork of [informagi/REL](github.com/informagi/REL) that fixes a bunch of issue a provides a working Dockerfile.

## Setup

```sh
git clone https://github.com/WearableComputerLab/REL.git
cd REL
docker build -t rel .
mkdir --mode=777 data
docker run --rm -it -p 127.0.0.1:5555:5555 -v $PWD/data:/home/rel/data rel
```

## Example use using CURL

```
% curl -XPOST --data '{"text":"Actually, Winston was not the prime minister of the UK when the UN was founded.","spans":[]}' -H'Content-Type: application/json' http://localhost:5555/        
[[10,7,"Winston","Winston_Churchill",0,0,"PER"],[52,2,"UK","United_Kingdom",0,0,"LOC"],[64,2,"UN","United_Nations",0,0,"ORG"]]
```
