# RISC-V 64 Docker Builder

Docker images for RISC-V 64 Jenkins agents.

## Usage

### Ubuntu 22.04 (Jammy Jellyfish)

Build & run:

```bash
cd ubuntu/jammy
make stop && make clean && make build
JENKINS_AGENT_SSH_PUBKEY="<pubkey>" make run
```

Stop & start:

```bash
make stop
make start
```

Connect using SSH:

```bash
ssh -i "<private_key>" -p 1022 jenkins@localhost
```

Connect using Jenkins, please refer to [SSH Build Agents | Jenkins plugin](https://plugins.jenkins.io/ssh-slaves/).

## References

- [jenkinsci/docker-ssh-agent: Docker image for Jenkins agents connected over SSH](https://github.com/jenkinsci/docker-ssh-agent)
