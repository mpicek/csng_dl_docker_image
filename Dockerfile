FROM nvcr.io/nvidia/pytorch:21.03-py3

COPY requirements.txt .

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip --no-cache-dir install -r requirements.txt

# Activate the environment, and make sure it's activated:
# Whenever we run a shell command (for example 'ls'), this
# whole thing is ran instead of the default '/bin/bash -c ls'

RUN echo "Make sure torch is installed"
RUN python -c "import torch"
RUN echo "Make sure neuralpredictors are installed"
RUN python -c "from neuralpredictors.measures.modules import Corr"
