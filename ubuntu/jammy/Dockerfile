FROM --platform=riscv64 buildpack-deps:jammy

WORKDIR /setupdir

COPY ./install-packages.sh .
RUN ./install-packages.sh

RUN useradd -m -s /bin/bash jenkins && \
	mkdir /home/jenkins/.ssh

EXPOSE 22

RUN cd && rm -rf /setupdir

COPY ./setup-sshd /usr/local/bin/setup-sshd
ENTRYPOINT ["setup-sshd"]
