FROM node:22.3.0-bookworm-slim

RUN npm install -g pnpm bun

COPY . /src

RUN rm -rf /src/apps/docs \
           /src/apps/screenshot-service \
           /src/apps/web \
           /src/apps/packages/api \
           /src/apps/packages/integrations/vercel

RUN chmod +x /src/start.sh

ENV NODE_ENV= \
    DATABASE_URL= \
    DATABASE_AUTH_TOKEN= \
    NODE_ENV= \
    UNKEY_TOKEN= \
    TINY_BIRD_API_KEY= \
    UPSTASH_REDIS_REST_URL= \
    UPSTASH_REDIS_REST_TOKEN= \
    RESEND_API_KEY= \
    TWILLIO_AUTH_TOKEN= \
    TWILLIO_ACCOUNT_ID= \
    SCREENSHOT_SERVICE_URL= \
    QSTASH_TOKEN=

WORKDIR /src/packages/db

RUN pnpm install

WORKDIR /src/apps

RUN bun install --ignore-scripts

EXPOSE 3000

WORKDIR /src/apps/server

ENTRYPOINT ["bash", "-c", "/src/start.sh"]

CMD ["bun", "start"]
