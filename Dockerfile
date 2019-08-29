FROM stefanfritsch/r_barebones_statup:3.5.3.20190828
LABEL maintainer="Stefan Fritsch <stefan.fritsch@stat-up.com>"

## Use littler installation scripts
# RUN Rscript -e "install.packages(c('littler', 'docopt'))" \
#  && ln -s /usr/local/lib/R/site-library/littler/examples/install2.r /usr/local/bin/install2.r \
#  && ln -s /usr/local/lib/R/site-library/littler/examples/installGithub.r /usr/local/bin/installGithub.r \
#  && ln -s /usr/local/lib/R/site-library/littler/bin/r /usr/local/bin/r \
#  && /usr/local/bin/install2.r data.table magrittr purrr tidyr ggplot2 plotly lubridate cowplot checkmate

COPY install_packages.r /root/install_packages.r
RUN Rscript /root/install_packages.r

EXPOSE 3838

CMD ["/sbin/my_init"]

