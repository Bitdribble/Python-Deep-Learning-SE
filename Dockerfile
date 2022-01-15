FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# pdl-se specific:
# swig required by the gym[box2d] python module
# python-opengl needed by keyboard_agent.py

RUN apt update; apt install -y \
    emacs \
    pip \
    python3 \
    python-opengl \
    sudo \
    swig \
    tzdata \
    vim

# Torch is large, pip runs out of memory w/o --no-cache-dir
# so preinstall torch
RUN pip3 install --default-timeout=300 --verbose --no-cache-dir torch==1.9.0

# Install the other requirements
COPY requirements.txt /tmp
RUN pip3 install --default-timeout=300 -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt