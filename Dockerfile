FROM debian:buster-slim

COPY options /root/.get_iplayer/options

# Install get_iplayer, using the instructions found at
# https://github.com/get-iplayer/get_iplayer/wiki/unixpkg, and by extension at
# https://software.opensuse.org/download.html?project=home%3Am-grant-prg&package=get-iplayer
RUN apt update \
  && apt install -y gpg curl \
  && echo 'deb http://download.opensuse.org/repositories/home:/m-grant-prg/Debian_10/ /' > /etc/apt/sources.list.d/home:m-grant-prg.list \
  && curl -fsSL https://download.opensuse.org/repositories/home:m-grant-prg/Debian_10/Release.key | gpg --dearmor > /etc/apt/trusted.gpg.d/home_m-grant-prg.gpg \
  && apt update \
  && apt install -y get-iplayer \
  && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["get_iplayer"]
