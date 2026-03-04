FROM node:18-alpine

WORKDIR /app

# Copia primeiro manifests pra aproveitar cache
COPY package*.json ./

RUN npm ci --only=production

# Copia o restante do código
COPY . .

# Atualiza pacotes do Alpine e limpa cache
RUN apk update && apk upgrade && rm -rf /var/cache/apk/*

# Segurança: não rodar como root
RUN chown -R node:node /app
USER node

EXPOSE 4000

CMD ["node", "server.js"]