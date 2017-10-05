FROM node:boron
MAINTAINER themoroccan09 <themoroccan09@github>

ENV APP_NAME=app-ts
ENV HOME=/usr/src/$APP_NAME
ENV LOG=/var/log/$APP_NAME
ENV PROJECT_DIR=./$APP_NAME

#-------------------TOOLS-----------------------
RUN apt-get update \
        && apt-get install -y git \
        nano \
        openssh-client \
        iputils-ping

#----------------Create folders and instal packages----------------------------
RUN mkdir -p $HOME $LOG
WORKDIR $HOME

COPY $PROJECT_DIR/package.json $HOME/package.json
RUN npm install

#---------------- Installation Global -----------------------------------------
RUN npm install -g gulp pm2


#--------------------- Copy files---------------- -----------------------------
COPY $PROJECT_DIR $HOME/

#---------------------Compile with gulp---------------------------------------
RUN gulp

#------------------------- START APP -----------------------------------------

CMD pm2-docker start dist/main.js
EXPOSE 3001
