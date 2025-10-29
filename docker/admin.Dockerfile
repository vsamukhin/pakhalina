FROM node:22-alpine

WORKDIR /app

RUN npm install -g pnpm

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
COPY apps/admin/package.json apps/admin/
COPY packages/shared/package.json packages/shared/
COPY tsconfig.base.json ./ 

RUN pnpm install

COPY apps/admin apps/admin
COPY packages/shared packages/shared

WORKDIR /app/apps/admin

CMD ["pnpm", "dev", "--host"]
