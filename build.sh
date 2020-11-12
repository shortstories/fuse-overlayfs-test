#!/bin/bash
# moby/buildkit:master-rootless \
docker run \
    -it \
    --rm \
    --privileged \
    -e BUILDKITD_FLAGS='--root=/tmp/.local/share/buildkit --oci-worker-no-process-sandbox --oci-worker-snapshotter=fuse-overlayfs' \
    -v $(pwd):/tmp/work \
    --entrypoint buildctl-daemonless.sh \
    reg.navercorp.com/ncc-bd/buildkit:master-20201112-1 \
        build \
        --frontend \
        dockerfile.v0 \
        --local context=/tmp/work \
        --local dockerfile=/tmp/work \
        --progress plain