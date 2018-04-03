# jenkins-miniconda
Jenkins installation with Miniconda3 on top.

Based on [jenkins/jenkins:lts](https://hub.docker.com/r/jenkins/jenkins/) and will be updated automatically on new release. On top of Jenkins [Miniconda with Python 3.6](https://conda.io/miniconda.html) is installed at `/opt/conda`. Use `--build-arg CONDA_DIR="<conda dir>"` to override the default installation path.
The [Mostly AI Anaconda Cloud](https://anaconda.org/mostlyai) channel is added as additional channel.

## Usage
`docker pull mostlyai/jenkins-miniconda`

General handling of the container is identical to the [official Jenkins Docker image](https://github.com/jenkinsci/docker/blob/master/README.md).

## Usage in Jenkins Projects
The following commands create and activate a conda environment in a Jenkins _Freestyle project_:
```
# Setup conda paths
. /opt/conda/etc/profile.d/conda.sh
# Activate conda environment
conda activate
# Create a test environment featuring the tools we need
conda create -y -q -p venv python=3.5 pytest coverage pylint pycodestyle
# Activate the environment we created
conda activate "$(pwd)/venv"
# Install the specific requirements of our project (requirements.txt must exist in project root)
conda install --file requirements.txt
```
