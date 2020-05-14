# build stage
FROM node:lts-alpine as build-stage

COPY . /app
WORKDIR /app
RUN npm install && npm run buildprod

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist/AC-Group-UI/ /usr/share/nginx/html
COPY --from=build-stage /app/nginx/default.conf /etc/nginx/conf.d/default.conf
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
