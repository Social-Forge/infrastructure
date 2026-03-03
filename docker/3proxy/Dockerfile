FROM alpine:latest

# Install 3proxy
RUN apk add --no-cache wget make gcc libc-dev && \
    wget -O 3proxy.tar.gz https://github.com/3proxy/3proxy/archive/refs/tags/0.9.5.tar.gz && \
    tar -xzf 3proxy.tar.gz && \
    cd 3proxy-0.9.5 && \
    ln -s Makefile.Linux Makefile && \
    make && \
    make install && \
    apk del wget make gcc libc-dev && \
    rm -rf /3proxy* /var/cache/apk/*

# Buat direktori untuk konfigurasi dan logs
RUN mkdir -p /etc/3proxy /var/log/3proxy

# Copy konfigurasi
COPY config/3proxy.cfg /etc/3proxy/3proxy.cfg

# Expose ports
EXPOSE 3129 1080

# Jalankan 3proxy
CMD ["3proxy", "/etc/3proxy/3proxy.cfg"]