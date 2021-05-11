FROM python:3.7.10

RUN apt-get update ##[edited]
RUN apt-get install ffmpeg libsm6 libxext6  -y

ARG USERNAME=development
RUN useradd -ms /bin/bash $USERNAME
USER $USERNAME

ENV PATH="/home/$USERNAME/.local/bin:${PATH}"

COPY ["requirements.txt","/home/$USERNAME"]
WORKDIR /home/$USERNAME

RUN pip install --upgrade pip
RUN pip install -r requirements.txt