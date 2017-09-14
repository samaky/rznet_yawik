#Download base image  yawik/yawik

FROM yawik/yawik

MAINTAINER  Samak Yodjunda

# Update Software repository
#Install Sendmail

RUN apt-get update && apt-get upgrade -y sendmail && rm -rf /var/lib/apt/lists/*

COPY ./config_files/sendmail.cf  /etc/mail/
COPY ./config_files/mail_config.sh /var/www/
COPY ./config_files/php.ini /usr/local/etc/php/php.ini
COPY ./config_files/yawik-site.conf /etc/apache2/sites-available/

RUN chmod +x /var/www/mail_config.sh

#Start send mail service

#CMD [ "bash /var/www/mail_config.sh" ]
