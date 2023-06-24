FROM ubuntu:23.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    apt-utils \
    build-essential \
    ca-certificates \
    curl \
    file \
    g++ \
    gh \
    git \
    make \
    nano \
    sudo \
    tree \
    wget \
    zsh \
    zlib1g-dev \
    libbz2-dev \
    libffi-dev \
    liblzma-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev 

RUN useradd -m -s /bin/bash newuser
RUN echo 'newuser:password' | chpasswd
RUN usermod -aG sudo newuser
USER newuser
WORKDIR /home/newuser

COPY setup.source        /home/newuser/setup.source
COPY test-new-python.py  /home/newuser/test-new-python.py
COPY test-new-numpy.py   /home/newuser/test-new-numpy.py
COPY requirements.txt    /home/newuser/requirements.txt

CMD [ "/bin/bash" ]
