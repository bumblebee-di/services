FROM alpine:3.12.4

# install
RUN apk update && apk upgrade
RUN apk add vsftpd \
openssl supervisor

# get SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt \
-subj '/CN=192.168.99.100'

# RUN openssl genrsa -des3 -out FTP.key && cp FTP.key FTP.key.orig
# RUN openssl rsa -in FTP.key.orig -out ftp.key
# RUN openssl x509 -req -days 365 -in certificate.csr -signkey ftp.key -outmycertificate.crt
# RUN cp ftp.key /etc/pki/tls/certs/ && cp mycertificate.crt /etc/pki/tls/certs

COPY /supervisor.conf /etc/supervisord.conf
COPY vsftpd.conf /etc/vsftpd.conf
COPY vsftpd.user_list /etc/vsftpd.user_list

COPY ftps-entrypoint.sh tmp/ftps-entrypoint.sh

RUN chmod +x tmp/ftps-entrypoint.sh

EXPOSE 21

ENTRYPOINT ["tmp/ftps-entrypoint.sh"]