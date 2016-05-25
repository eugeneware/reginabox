FROM node:6
RUN apt-get update && apt-get install -y libavahi-compat-libdnssd-dev
VOLUME ["/data"]
ENV HOME=/home/app
WORKDIR $HOME

RUN mkdir -p /home/app
COPY package.json /home/app
RUN npm install
COPY . /home/app

ENV PORT 9000
EXPOSE 9000

CMD [ "npm", "start" ]
