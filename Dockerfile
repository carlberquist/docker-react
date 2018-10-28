# AS, temp container
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# puts all in /app but we only need /app/build

FROM nginx
# used by deployement server to expose to incoming traffic
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
