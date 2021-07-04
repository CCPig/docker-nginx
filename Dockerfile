FROM centos:7.7.1908
MAINTAINER chaochen 
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo ‘Asia/Shanghai’ >/etc/timezone
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak && \
    curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo &&\
	yum makecache && \
    yum install -y wget gcc gcc-c++ pcre-devel openssl-devel zlib-devel make libxml2 libxml2-dev libxslt-devel
RUN yum install -y gd gd-devel
RUN yum install -y perl-devel perl-ExtUtils-Embed net-tools unzip

ADD nginx_devel_kit.tar.gz /opt/
ADD v0.10.13.tar.gz /opt/
ADD LuaJIT-2.0.4.tar.gz /opt/
ADD nginx-1.18.0.tar.gz /opt/
ADD libunwind-0.99-beta.tar.gz /opt/
ADD gperftools-2.5.tar.gz /opt/
RUN cd /opt/libunwind-0.99-beta && \
	./configure && \
	make && make install

RUN cd /opt/gperftools-2.5 && \
	./configure && \
	make && make install

RUN cd /opt/LuaJIT-2.0.4 && make && make install 


#nginx
RUN cd /opt/nginx-1.18.0 && \
./configure --prefix=/usr/share/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --http-client-body-temp-path=/var/lib/nginx/tmp/client_body --http-proxy-temp-path=/var/lib/nginx/tmp/proxy --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi --http-scgi-temp-path=/var/lib/nginx/tmp/scgi --pid-path=/run/nginx.pid --lock-path=/run/lock/subsys/nginx --with-file-aio --with-ipv6 --with-http_ssl_module --with-http_v2_module --with-http_realip_module --with-stream_ssl_preread_module --with-http_addition_module --with-http_xslt_module=dynamic --with-http_image_filter_module=dynamic --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_degradation_module --with-http_slice_module --with-http_stub_status_module --with-http_perl_module=dynamic --with-http_auth_request_module --with-mail=dynamic --with-mail_ssl_module --with-pcre --with-pcre-jit --with-stream=dynamic --with-stream_ssl_module --with-google_perftools_module --with-debug --with-ld-opt=-Wl,-E,-rpath,/usr/local/lib --add-module=/opt/ngx_devel_kit-0.3.0 --add-module=/opt/lua-nginx-module-0.10.13

RUN cd /opt/nginx-1.18.0 && make && make install 


#添加环境变量
COPY nginx/nginx.conf /etc/nginx
COPY nginx/lua /etc/nginx/lua
COPY start.sh /opt/
RUN chmod +x /usr/sbin/nginx && \
	mkdir -p /var/lib/nginx/tmp/client_body && \
	chmod +x /opt/start.sh

ADD luarocks-2.4.3.tar.gz /opt
RUN cd /opt/luarocks-2.4.3 &&\
	./configure --with-lua-bin=/usr/bin/ --with-lua-include=/usr/local/include/luajit-2.0 && \
	make build && make install && \
	luarocks install lua-cjson

EXPOSE 80
EXPOSE 18080
EXPOSE 443 
WORKDIR /opt
CMD ["nginx","-g","daemon off;"]

