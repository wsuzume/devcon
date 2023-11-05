ARG NODE_IMAGE

FROM node:21-bookworm

WORKDIR /project

COPY pkg/package.json pkg/yarn.lock /project/

RUN yarn install --frozen-lockfile

COPY app /project/app/

# ビルド
RUN yarn build

# 開発サーバーを起動するコマンド
CMD ["yarn", "dev"]
