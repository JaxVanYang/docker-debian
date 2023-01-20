FROM --platform=riscv64 buildpack-deps:jammy

WORKDIR /setupdir

COPY ./install-packages.sh .
RUN ./install-packages.sh

# setup a more secure SSH server
# copied from jenkinsci/docker-ssh-agent
RUN sed -i /etc/ssh/sshd_config \
        -e 's/#PermitRootLogin.*/PermitRootLogin no/' \
        -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
        -e 's/#PasswordAuthentication.*/PasswordAuthentication no/' \
        -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
        -e 's/#LogLevel.*/LogLevel INFO/'

RUN useradd -m -s /bin/bash jenkins && \
	mkdir /home/jenkins/.ssh

EXPOSE 22

RUN cd && rm -rf /setupdir

COPY ./setup-sshd.sh /usr/local/bin/setup-sshd
ENTRYPOINT ["setup-sshd"]
