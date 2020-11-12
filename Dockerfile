FROM alpine/git AS fuse-overlayfs-test-src
WORKDIR /usr/src
RUN git clone https://github.com/shortstories/fuse-overlayfs-test.git fuse-overlayfs-test

FROM golang:1.14-buster
WORKDIR /build

RUN --mount=from=fuse-overlayfs-test-src,src=/usr/src/fuse-overlayfs-test,target=.,readwrite \

RUN go build -o fuse-overlayfs-test . && \
    ./fuse-overlayfs-test && \
    ls -al

RUN ls -al