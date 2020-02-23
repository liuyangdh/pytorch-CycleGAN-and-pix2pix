FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-runtime

RUN apt update && apt install -y wget unzip curl bzip2 git

# python dependencies
COPY requirements.txt /tmp/
RUN pip --no-cache-dir install -r /tmp/requirements.txt

# copy files inside
COPY . /p2p
WORKDIR /p2p
