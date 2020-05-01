FROM node:lts

MAINTAINER Joseph Lee <development@jc-lab.net>

RUN mkdir -p /local-npm
WORKDIR /local-npm
ADD ["package.json", "."]

RUN groupadd -r local-npm --gid=999 \
    && useradd -r -g local-npm --uid=999 local-npm

EXPOSE 5080
EXPOSE 16984

VOLUME /data

ENV DATA_DIRECTORY='/data'
ENV REMOTE_REGISTRY='https://registry.npmjs.org'
ENV REMOTE_REGISTRY_SKIMDB='https://skimdb.npmjs.com/registry'

RUN npm set progress=false && npm install --no-color && npm dedupe

ADD ["docker-entrypoint.sh", "/"]
RUN chmod +x /docker-entrypoint.sh

CMD /docker-entrypoint.sh

