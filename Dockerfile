FROM nginx
EXPOSE 80 443
COPY . /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf
RUN openssl req -x509 -nodes -days 365 -subj "/C=IN/ST=KA/O=Heinekn, Inc./CN=heineken.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]
