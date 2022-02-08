FROM nvcr.io/nvidia/pytorch:21.03-py3

# Create the environment:
COPY csng-dl.yml .
RUN conda env create -f csng-dl.yml

# Activate the environment, and make sure it's activated:
# Whenever we run a shell command (for example 'ls'), this
# whole thing is ran instead of the default '/bin/bash -c ls'
SHELL ["conda", "run", "-n", "csng-dl", "/bin/bash", "-c"]

RUN echo "Make sure torch is installed"
RUN python -c "import torch"
RUN echo "Make sure neuralpredictors are installed"
RUN python -c "from neuralpredictors.measures.modules import Corr"

