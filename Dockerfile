FROM node:14 as node

WORKDIR /DEVOPS_PROJECT_FRONT

COPY . /DEVOPS_PROJECT_FRONT

RUN npm cache clean --force
RUN npm install --force
RUN npm run build --prod
RUN npm install @angular/cli

FROM nginx:alpine

COPY --from=node /DevOps_Project_Front\dist\summer-workshop-angular /usr/share/nginx/html
