
#PHASE1

FROM node:lts-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build Folder in the Container/image will have all the source code we used the COPY command for.

#PHASE2 - RUN PHASE

FROM nginx
EXPOSE 80
COPY --from=0 /app/build usr/share/nginx/html


