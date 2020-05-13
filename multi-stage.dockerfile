# 개발환경이나 기타 특수 환경이 아닌 docker 환경에서 빌드하기 위해 아래처럼 작성해야한다.
# Multi stage

FROM node:latest AS build
WORKDIR /home/node/app
COPY src ./src
COPY package.json ./package.json
COPY package-lock.json ./package-lock.json
RUN npm install

FROM node:latest
WORKDIR /home/node/app
COPY --from=build /home/node/app/ .
CMD yarn serve

EXPOSE 8080