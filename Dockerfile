FROM node:18

WORKDIR /app

# Instala herramientas necesarias
RUN apt-get update && apt-get install -y git && npm install -g concurrently

# Clona Flowise
RUN git clone https://github.com/FlowiseAI/Flowise.git flowise
WORKDIR /app/flowise
RUN npm install

# Clona Cal.com
WORKDIR /app
RUN git clone https://github.com/calcom/cal.com.git cal
WORKDIR /app/cal
RUN npm install

# Vuelve al root
WORKDIR /app

# Ejecuta ambos servicios
CMD concurrently \
  "npm run start --prefix ./flowise" \
  "npm run start --prefix ./cal"