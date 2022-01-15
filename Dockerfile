FROM node:17-alpine as builder

WORKDIR /app

COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
#Copy the build folder from the builder 
COPY --from=builder /app/build /usr/share/nginx/html 
