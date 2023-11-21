FROM nvcr.io/nvidia/pytorch:21.03-py3

COPY requirements.txt .

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip --no-cache-dir install -r requirements.txt || exit 1

# Check if torch is installed
RUN python -c "import torch" || { echo 'torch installation failed' ; exit 1; }

# Check if neuralpredictors is properly installed
RUN python -c "from neuralpredictors.measures.modules import Corr" || { echo 'neuralpredictors installation failed' ; exit 1; }
