FROM node:boron
MAINTAINER themoroccan09 <@themoroccan09>

ENV HOME=/usr/src/fm-calculator
ENV LOG=/var/log/fm-calculator
ENV PROJECT_DIR=./project_name
WORKDIR $HOME

#-------------------TOOLS-----------------------
RUN apt-get update \
        && apt-get install -y git \
        nano \
        openssh-client \
        iputils-ping

#----------------Create folders and instal packages----------------------------
RUN mkdir -p $HOME
RUN mkdir -p $LOG
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
