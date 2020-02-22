FROM python:3.7

# set environment variables
ENV DISABLE_CONTRACTS=1

# install apt dependencies
RUN apt update && apt install -y wget unzip curl bzip2 git
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

RUN conda install -y pytorch torchvision -c pytorch

# copy files inside
COPY . /p2p
WORKDIR "p2p"

RUN pip install -r requirements.txt
