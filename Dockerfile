FROM node:alpine
WORKDIR '/src/app'
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn generate

FROM nginx
EXPOSE 80
COPY --from=0 /src/app/dist /usr/share/nginx/html
