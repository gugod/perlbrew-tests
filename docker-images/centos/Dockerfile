FROM centos

RUN yum install -y bzip2 make perl-core.x86_64 gcc && \
    groupadd -r nonroot && \
    useradd -r -g nonroot -d /home/nonroot -s /sbin/nologin -c "Nonroot User" nonroot && \
    mkdir /home/nonroot && \
    chown -R nonroot:nonroot /home/nonroot

USER nonroot
WORKDIR /home/nonroot
