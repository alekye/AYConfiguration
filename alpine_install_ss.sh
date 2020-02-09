apk add --no-cache --virtual .build-deps \
      autoconf \
      automake \
      build-base \
      c-ares-dev \
      libcap \
      libev-dev \
      libtool \
      libsodium-dev \
      linux-headers \
      mbedtls-dev \
      pcre-dev
apk add git
cd /root
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive
./autogen.sh
./configure --prefix=/usr --disable-documentation
make install
ls /usr/bin/ss-* | xargs -n1 setcap cap_net_bind_service+ep

CONFIG='''
{
    "server":["[::0]","0.0.0.0"],
    "server_port":6789,
    "password":"03ac9b8ce112c99de723b77225403286",
    "timeout":300,
    "user":"nobody",
    "method":"chacha20-ietf-poly1305",
    "fast_open":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp"
}
''';
echo $CONFIG > /root/config.json;
ss-server -c /root/config.json &
echo "ss-server -c /root/config.json" > /etc/local.d/ss.start
chmod +x /etc/local.d/ss.start
rc-update add local