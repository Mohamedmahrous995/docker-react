FROM node:alpine as builder 
WORKDIR '/app'

COPY package.json .
RUN npm install
COPY . . 
RUN npm build

FROM nginx
COPY --from=builder /app/build /user/share/nginx/html