FROM alpine:3.12.4

# install
RUN apk update && apk upgrade
RUN apk add --no-cache vsftpd \
openssl

# get SSL certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout \
/etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem\
-subj '/CN=localhost'

COPY vsftpd.conf /etc/vsftpd.conf
COPY vsftpd.user_list /etc/vsftpd.user_list

COPY ftps-entrypoint.sh tmp/ftps-entrypoint.sh

RUN chmod +x tmp/ftps-entrypoint.sh

EXPOSE 21

ENTRYPOINT ["tmp/ftps-entrypoint.sh"]