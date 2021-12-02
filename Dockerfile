# BUILD PHASE
FROM node:14-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .

RUN yarn build

# RUN PHASE
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
