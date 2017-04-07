FROM ubuntu:16.04
RUN apt-get -y update 
RUN apt-get install -y sudo
RUN apt-get install -q -y git

RUN apt-get install -q -y influxdb

RUN mkdir -p /var/azuracast/www
RUN cd /var/azuracast/www
RUN git clone https://github.com/SlvrEagle23/AzuraCast.git /var/azuracast/www

RUN chmod a+x /var/azuracast/www/install.sh
RUN chmod a+x /var/azuracast/www/update.sh


RUN cd /var/azuracast/www/ && ./install.sh

CMD cd /var/azuracast/www/ && ./update.sh

EXPOSE 80 443