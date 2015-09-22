

FROM centos:centos7
MAINTAINER makky <makky.4d6b.3f5@gmail.com>


# add npm package
RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm

# update epel-release
RUN yum remove -y epel-release
RUN yum install -y epel-release

# add required packages
RUN yum install -y git python openssl-devel gcc gcc-c++

# nginx
RUN yum install -y nginx --enablerepo=nginx
RUN rm /usr/share/nginx/html/*


# clone repository
RUN git clone https://github.com/makky3939/suiko-fes.git

# copy
RUN mkdir /usr/share/nginx/html/suiko-fes
RUN cp -r suiko-fes/* /usr/share/nginx/html/suiko-fes/

# port open
EXPOSE 80

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]