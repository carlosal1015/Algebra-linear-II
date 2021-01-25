# Copyleft (c) August, 2020, Oromion.
# Docs: https://www.digitalocean.com/community/tutorials/how-to-install-git-on-debian-10
# Docs: https://github.com/Seanny123/dockerfiles/blob/master/pyjulia/Dockerfile
FROM julia:1.5.3-buster

LABEL maintainer="Oromion <caznaranl@uni.pe>" \
  name="Plots" \
  description="Julia image with Plots packages." \
  url="https://github.com/users/carlosal1015/packages/container/package/algebra-linear-ii" \
  vcs-url="https://github.com/carlosal1015/Algebra-linear-II" \
  vendor="Oromion Aznarán" \
  version="1.0"

ENV MAIN_PKGS="\
  git" \
  # GIT_BUILD_PKGS="\
  # make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip" \
  GCC_PKGS="\
  gcc g++ python" \
  DEBIAN_FRONTEND=noninteractive \
  JULIA_PROJECT=/root

COPY *.toml ${JULIA_PROJECT}

RUN ls /root

RUN rm -f /etc/localtime && \
  ln -s /usr/share/zoneinfo/America/Lima /etc/localtime && \
  apt-get update -qq && \
  apt-get install -yq --no-install-recommends $MAIN_PKGS

# cd /tmp && curl -LO https://codeload.github.com/git/git/zip/v2.29.2 && \
# unzip v2.29.2 && cd git-2.29.2 && make prefix=/usr/local all && \
# make prefix=/usr/local install && \
# apt-get install -yq --no-install-recommends $GCC_PKGS

RUN	julia -e 'using Pkg;Pkg.instantiate();Pkg.activate("/root");using PackageCompiler;create_sysimage([:Latexify, :Plots]; cpu_target="generic",replace_default=true);'

RUN ls
# julia -e 'using Pkg; Pkg.activate("");using PackageCompiler;create_sysimage([:Latexify, :Plots]; sysimage_path="IntroLinearAlgebra.so", precompile_execution_file="start.jl", cpu_target="skylake");'

# RUN	apt-get -yq purge $GIT_BUILD_PKGS && \
#   apt-get -yq autoremove && \
#   rm -rf /var/lib/apt/lists/*

RUN	apt-get -yq autoremove && \
  rm -rf /var/lib/apt/lists/*
