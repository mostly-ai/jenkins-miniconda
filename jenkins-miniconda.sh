#! /bin/bash -e

# Setup Miniconda environment
. /usr/lib/miniconda/etc/profile.d/conda.sh

# Execute original jenkins script
exec "/usr/local/bin/jenkins.sh" "$@"
