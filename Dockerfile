
#PHASE1

FROM node:lts-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build Folder in the Container/image will have all the source code we used the COPY command for.

#PHASE2 - RUN PHASE

FROM nginx
COPY --from=builder /app/build usr/share/nginx/html


