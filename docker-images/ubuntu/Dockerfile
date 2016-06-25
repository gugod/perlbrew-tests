FROM ubuntu

RUN apt-get update && \
    apt-get install -yq --no-install-recommends ca-certificates build-essential curl tmux && \
    apt-get clean && \
    groupadd -r nonroot && \
    useradd -r -g nonroot -d /home/nonroot -s /sbin/nologin -c "Nonroot User" nonroot && \
    mkdir /home/nonroot && \
    chown -R nonroot:nonroot /home/nonroot && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp

USER nonroot
WORKDIR /home/nonroot
