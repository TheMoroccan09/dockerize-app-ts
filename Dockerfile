FROM node:boron
MAINTAINER themoroccan09 <themoroccan09@github>

ENV APP_NAME=app
ENV HOME=/usr/src/$APP_NAME
ENV LOG=/var/log/$APP_NAME

####### UTILS
RUN apt-get update \
        && apt-get install -y git \
        nano \
        openssh-client \
        iputils-ping

####### Install dependencies
RUN mkdir -p $HOME $LOG
WORKDIR $HOME
RUN npm i -g typescript gulp pm2
COPY ./package.json ./gulpfile.js $HOME/
RUN npm install

####### Copy Files
COPY ./src/ $HOME/

#---------------------Compile and clean folder---------------------------------------n
RUN gulp compile
RUN rm -rf $HOME/src


#------------------------- START APP -----------------------------------------
ENTRYPOINT ["pm2-docker", "dist/src/main.js"]
EXPOSE 3000