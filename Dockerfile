FROM golang:1.13-buster

COPY . .

RUN go build -o fuse-overlayfs-test . && \
    ./fuse-overlayfs-test && \
    ls -al

RUN ls -al