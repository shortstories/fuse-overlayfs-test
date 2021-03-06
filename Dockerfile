FROM alpine/git AS fuse-overlayfs-test-src
WORKDIR /usr/src
RUN git clone https://github.com/shortstories/fuse-overlayfs-test.git fuse-overlayfs-test

FROM golang:1.14-buster
WORKDIR /build

RUN --mount=from=fuse-overlayfs-test-src,src=/usr/src/fuse-overlayfs-test,target=.,readwrite \
    go build -o fuse-overlayfs-test . && \
    cp fuse-overlayfs-test /usr/local/bin/fuse-overlayfs-test && \
    chmod +x /usr/local/bin/fuse-overlayfs-test

RUN fuse-overlayfs-test && ls -al /usr/local/bin
RUN ls -al /usr/local/bin
