# Etapa 1: Dependencias
FROM node:20-alpine AS dependencies
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --omit=dev && npm cache clean --force

# Etapa 2: Runner final
FROM node:20-alpine AS runner
WORKDIR /usr/src/app

ENV NODE_ENV=production
ENV PORT=3000

COPY --chown=node:node --from=dependencies /usr/src/app/node_modules ./node_modules
COPY --chown=node:node . .

USER node
EXPOSE 3000

CMD ["node", "src/index.js"]
