# Define em qual imagem de basear
FROM node:10.16.3-alpine

# Adiciona metadados a essa imagem
LABEL maintainer="Diogo Lessa" email="diogolessacosta@gmail.com"

# Cria o diretório da aplicação dentro do container
WORKDIR /app

# Copia os arquivos `package.json` e `package-lock.json` pra dentro do diretório da app
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia toda a aplicação pra dentro do diretório /app do container
COPY . .

# Expõe a porta 4000
EXPOSE 4000

# Executa quando o container é startado (docker container run)
# O comando `CMD ["npm", "start"]` também funciona porém é recomendado
# usar da forma abaixo pois reduz o número de processos rodando no container
# e permite que o Node.js processe os erros ao invés do npm, que os "engole"
CMD ["node", "src/app.js"]