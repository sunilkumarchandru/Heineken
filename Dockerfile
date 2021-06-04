FROM nginx
EXPOSE 80 443
COPY images /usr/share/nginx/html/
COPY styles /usr/share/nginx/html/
COPY CODE_OF_CONDUCT.md /usr/share/nginx/html/
COPY LICENSE /usr/share/nginx/html/
COPY README.md /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf
RUN openssl req -x509 -nodes -days 365 -subj "/C=IN/ST=KA/O=Heinekn, Inc./CN=heineken.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'; nginx -s reload;"]
