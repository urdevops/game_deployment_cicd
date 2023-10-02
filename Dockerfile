FROM ubuntu:22.04
RUN apt-get update && apt-get install -y nginx zip curl
RUN sed -i '/daemon off;/d' /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /var/www/html/master.zip -L https://github.com/kloudskart/game_deployment_cicd/archive/master.zip
RUN cd /var/www/html/ && unzip master.zip && mv game_deployment_cicd-master/* . && rm -rf game_deployment_cicd-master master.zip
EXPOSE 80
CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
