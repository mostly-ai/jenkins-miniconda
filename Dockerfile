FROM jenkins/jenkins:lts

LABEL maintainer="ci@mostly.ai"

USER root

# Install Miniconda
RUN mkdir /tmp/miniconda
WORKDIR /tmp/miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN chmod +x Miniconda3-latest-Linux-x86_64.sh
RUN ./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/lib/miniconda

# Setup Miniconda paths
ENV CONDA_ENVS_PATH="~/conda_envs"
ENV PATH="$PATH:/usr/lib/miniconda/bin"

# Clean up
WORKDIR /
RUN rm -rf /tmp/miniconda

USER jenkins
