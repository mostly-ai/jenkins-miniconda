FROM jenkins/jenkins:lts

LABEL maintainer="ci@mostly.ai"

USER root

# Install Miniconda
RUN mkdir /tmp/miniconda
WORKDIR /tmp/miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN chmod +x Miniconda3-latest-Linux-x86_64.sh
RUN ./Miniconda3-latest-Linux-x86_64.sh -b -p /usr/lib/miniconda

# Setup Miniconda
ENV CONDA_ENVS_PATH="~/conda_envs"
RUN chmod +x /usr/lib/miniconda/etc/profile.d/conda.sh
RUN chmod +x /usr/lib/miniconda/etc/profile.d/conda.csh

# Replace entrypoint by our entrypoint that sets up the Miniconda environment
COPY jenkins-miniconda.sh /usr/local/bin/jenkins-miniconda.sh
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins-miniconda.sh"]

# Clean up
WORKDIR /
RUN rm -rf /tmp/miniconda

USER jenkins
