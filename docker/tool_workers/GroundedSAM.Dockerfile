# Use NVIDIA CUDA base image
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

# Set environment variables
ENV PYTHONFAULTHANDLER=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    MPLCONFIGDIR=/tmp/matplotlib \
    TRANSFORMERS_CACHE=/models \ 
    CUDA_HOME=/usr/local/cuda

# Install Miniconda for Conda management
RUN apt-get update && \ 
    apt-get install -y git vim build-essential procps net-tools tini wget python3.11-dev python3-pip ffmpeg libsm6 libxext6 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./Grounded-Segment-Anything /GSA

RUN pip install -r /GSA/requirements.txt && \
    pip install -e /GSA/GroundingDINO && \
    pip install -e /GSA/segment_anything 

WORKDIR /workspace

# Set the entrypoint
 CMD ["tini","--","tail", "-f", "/dev/null"]