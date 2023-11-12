ARG NODE_IMAGE

FROM ${NODE_IMAGE}

RUN apt-get update && apt-get install -y vim

WORKDIR /project

COPY project/package.json project/package-lock.json /project/
COPY project/app /project/app/
COPY server.mjs /project/

RUN npm ci
RUN npx remix build



