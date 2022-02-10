FROM centos:8

# replace package manager mirrorlists and link to archival repository vault.centos.org
# to be able to run yum commands after Centos 8 EOL date
# https://www.centos.org/centos-linux-eol/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-* &&\
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*

RUN yum -y update
RUN yum -y install httpd
#changed /var/www/httpd/index.html to /var/www/html/index.html
RUN echo "Hello Kolomolo" >> /var/www/html/index.html

EXPOSE 80

COPY run.sh /run.sh
RUN chmod -v +x /run.sh

CMD ["/run.sh"]