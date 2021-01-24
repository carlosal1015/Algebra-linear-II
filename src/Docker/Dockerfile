#https://gitlab.com/courses-2020-1/abet-project/-/raw/master/src/docker/Mtpro2.Dockerfile
# Copyleft (c) August, 2020, Oromion.
# Docs: https://pctex.com/kb/74.html
# apt-get vs apt: https://askubuntu.com/a/990838/791670
# curl -sfL https://raw.githubusercontent.com/carlosal1015/mathtime-installer/carlosal1015/mtpro2-texlive.sh | sh +m -i mtp2lite.zip.tpm
# https://stackoverflow.com/a/14638025/9302545

FROM registry.gitlab.com/islandoftex/images/texlive

LABEL maintainer="Oromion <caznaranl@uni.pe>" \
  name="Mtpro2 TeXLive" \
  description="Mtpro2 in TeXLive." \
  url="https://github.com/users/carlosal1015/packages/container/package/algebra-linear-ii" \
  vcs-url="https://github.com/carlosal1015/Algebra-linear-II" \
  vendor="Oromion Aznarán" \
  version="1.0"

ENV MAIN_PKGS="\
  git ghostscript inkscape" \
  PIP_PKGS="\
  python3-requests python3-bs4" \
  DEBIAN_FRONTEND=noninteractive \
  JULIA_PATH=/usr/local/julia \
  PATH=$JULIA_PATH/bin:$PATH \
  JULIA_VERSION=1.5.3

RUN rm -f /etc/localtime && \
  ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  apt-get update -qq && \
  apt-get install -yq --no-install-recommends $MAIN_PKGS && \
  rm -rf /var/lib/apt/lists/* && \
  cd /tmp && \
  wget -q https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.3-linux-x86_64.tar.gz && \
  mkdir $JULIA_PATH && \
  tar -xzf julia-1.5.3-linux-x86_64.tar.gz -C "$JULIA_PATH" --strip-components 1 && \
  ln -s $JULIA_PATH/bin/julia /usr/local/bin/julia && \
  rm julia-1.5.3-linux-x86_64.tar.gz && \
  julia -e 'using Pkg; Pkg.add(name="Weave", version="0.10.2")' >/dev/null 2>&1 && \
  wget -q https://raw.githubusercontent.com/carlosal1015/mathtime-installer/carlosal1015/mtp2lite.zip.tpm && \
  unzip -qq mtp2lite.zip.tpm && \
  cp -R texmf/* $(kpsewhich --var-value TEXMFLOCAL) && \
  mkdir -p ~/.local/share/fonts && \
  wget -q https://github.com/tonsky/FiraCode/archive/5.2.zip && \
  unzip -jq 5.2.zip 'FiraCode-5.2/distr/ttf/*.ttf' -d ~/.local/share/fonts && \
  wget -q https://github.com/alexeiva/yanone-kaffeesatz/archive/2.000.zip && \
  unzip -jq 2.000.zip 'yanone-kaffeesatz-2.000/fonts/ttf/*.ttf' -d ~/.local/share/fonts && \
  wget -q https://software.sil.org/downloads/r/andika/Andika-5.000.zip && \
  unzip -jq Andika-5.000.zip 'Andika-5.000/*.ttf' -d ~/.local/share/fonts && \
  fc-cache -f && \
  rm -rf /tmp/* && \
  texhash && \
  updmap-sys --quiet --enable Map mtpro2.map && \
  updmap-sys --quiet --disable Map=belleek.map