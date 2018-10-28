# AS, temp container
FROM node:alpine AS builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# puts all in /app but we only need /app/build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
