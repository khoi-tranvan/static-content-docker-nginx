#STAGE 1
FROM  node:18-alpine as builder

WORKDIR /app
COPY . /app

#STAGE 2
FROM nginx:stable-alpine
COPY --from=builder /app/static /usr/share/nginx/html
COPY --from=builder /app/nginx.conf /etc/nginx/conf.d/default.conf
CMD [ "nginx","-g","daemon off;" ]