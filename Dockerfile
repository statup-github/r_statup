FROM phusion/baseimage
MAINTAINER Stefan Fritsch <stefan.fritsch@stat-up.com>

ENV RVERSION="3.5.0"

ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    TERM=xterm

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    bash-completion \
    ca-certificates \
    file \
    fonts-texgyre \
    g++ \
    gfortran \
    gsfonts \
    libblas-dev \
    libbz2-1.0 \
    libcurl3 \
    libicu55 \
    libjpeg62 \
    libopenblas-dev \
    libpangocairo-1.0-0 \
    libpcre3 \
    libpng16-16 \
    libreadline6 \
    libtiff5 \
    liblzma5 \
    locales \
    make \
    unzip \
    zip \
    zlib1g \
    file \
    git \
    libapparmor1 \
    libcurl4-openssl-dev \
    libedit2 \
    libssl-dev \
    lsb-release \
    psmisc \
    python-setuptools \
    sudo \
    wget \
    multiarch-support \
    libudunits2-dev \
    libudunits2-0 \
    dnsutils \
    bzip2 \
    nano \
    icedtea-netx \
    libgdal-dev \
    libproj-dev \
    libgeos-dev \
    libgsl0-dev \
    librsvg2-dev \
    libxcb1-dev \
    libxdmcp-dev \
    libxslt1-dev \
    libxt-dev \
    mdbtools \
    netcdf-bin \
    curl \
    default-jdk \
    libbz2-dev \
    libcairo2-dev \
    libcurl4-openssl-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libicu-dev \
    libpcre3-dev \
    libpng-dev \
    libreadline-dev \
    libtiff5-dev \
    liblzma-dev \
    libx11-dev \
    libxt-dev

RUN echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
    && echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen

RUN update-locale

RUN cd /opt \
    && wget https://mran.blob.core.windows.net/install/mro/${RVERSION}/microsoft-r-open-${RVERSION}.tar.gz \
    && tar -xf microsoft-r-open-${RVERSION}.tar.gz \
    && rm microsoft-r-open-${RVERSION}.tar.gz \
    && cd microsoft-r-open/ \
    && ./install.sh -a -u \
    && cd .. \
    && rm -r microsoft-r-open

## Use littler installation scripts
# RUN Rscript -e "install.packages(c('littler', 'docopt'))" \
#  && ln -s /usr/local/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
#  && ln -s /usr/local/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
#  && ln -s /usr/local/lib/R/site-library/littler/bin/r /usr/local/bin/r \
#  && /usr/local/bin/install2.r data.table magrittr purrr tidyr ggplot2 plotly lubridate cowplot checkmate

COPY install_packages.r /root/install_packages.r
RUN Rscript /root/install_packages.r

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3838

CMD ["/sbin/my_init"]

