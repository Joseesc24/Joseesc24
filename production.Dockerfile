FROM python:3.7.10

RUN apt-get update ##[edited]
RUN apt-get install ffmpeg libsm6 libxext6  -y

ARG USERNAME=production
ARG WORKDIR=/home/$USERNAME

RUN useradd -ms /bin/bash $USERNAME
RUN mkdir -p $WORKDIR/requirements/

COPY ["requirements/commons.txt","$WORKDIR/requirements/"]

RUN find "$WORKDIR/" -type d -exec chmod 755 {} \;
RUN find "$WORKDIR/" -type f -exec chmod 755 {} \;

ENV PATH="$WORKDIR/.local/bin:${PATH}"

RUN chown -R $USERNAME $WORKDIR
RUN chmod 755 $WORKDIR

WORKDIR $WORKDIR
USER $USERNAME

RUN pip install --upgrade pip
RUN pip install -r requirements/commons.txt

COPY [".","$WORKDIR"]