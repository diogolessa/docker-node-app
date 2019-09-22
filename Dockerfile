FROM node:10.16.3-alpine

# Cria o diretório da aplicação dentro do container
WORKDIR /app

# Copia os arquivos `package.json` e `package-lock.json` pra dentro do diretório da app
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia toda a aplicação pra dentro do diretório /app do container
COPY . .

EXPOSE 4000

# Executa 
CMD ["npm", "start"]