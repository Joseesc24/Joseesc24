FROM python:3.7.10
#COPY ["requirements.txt","/usr/src/"]
WORKDIR /usr/src
RUN mkdir low_resolution_images
RUN mkdir high_resolution_images
RUN pip install --upgrade pip
#RUN pip install -r requirements.txt