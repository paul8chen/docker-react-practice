## PRODUCTION MODE

# BUILD PHASE
FROM  node:16-alpine as builder

# RUN mkdir -p /home/node/app/node_modules

# WORKDIR /home/node/app

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY  ./ ./

RUN npm run build

# RUN PHASE
FROM nginx


COPY --from=builder /app/build /usr/share/nginx/html
