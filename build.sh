#!/bin/bash

docker run \
    -it \
    --rm \
    --privileged \
    -e BUILDKITD_FLAGS='--root=/tmp/.local/share/buildkit --oci-worker-no-process-sandbox --oci-worker-snapshotter=fuse-overlayfs' \
    -v $(pwd):/tmp/work \
    --entrypoint buildctl-daemonless.sh \
    moby/buildkit:master-rootless \
        build \
        --frontend \
        dockerfile.v0 \
        --local context=/tmp/work \
        --local dockerfile=/tmp/work \
        --progress plain