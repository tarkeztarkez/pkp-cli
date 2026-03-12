FROM oven/bun:1.3.9 AS base

WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile --production

COPY index.ts tsconfig.json ./
COPY src ./src

EXPOSE 3000

USER bun

CMD ["bun", "run", "./index.ts", "server", "serve", "--host", "0.0.0.0", "--port", "3000"]
