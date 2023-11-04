FROM node:16 as node

WORKDIR /DevOps_Project_Front

COPY . /DevOps_Project_Front

#RUN npm cache clean --force
RUN npm install --force
RUN npm run build --prod
RUN npm install @angular/cli

FROM nginx:alpine

COPY --from=node /DevOps_Project_Front/dist/summer-workshop-angular /usr/share/nginx/html
