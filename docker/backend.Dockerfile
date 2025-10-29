FROM node:22-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY apps/backend/package.json apps/backend/
COPY packages/shared/package.json packages/shared/
COPY tsconfig.base.json ./ 

RUN pnpm install

COPY apps/backend apps/backend
COPY packages/shared packages/shared

WORKDIR /app/apps/backend

CMD ["pnpm", "dev"]
