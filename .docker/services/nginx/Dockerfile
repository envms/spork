# set mainline tag as the base image for dev
FROM nginx:mainline

# remove default configuration
RUN rm -rf /etc/nginx/nginx.conf /etc/nginx/conf.d /etc/nginx/includes /etc/nginx/tls

# create the custom log directory
RUN mkdir -m777 -p -v /var/log/sf/nginx

# install helpful development tools
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends --no-install-suggests --yes \
    curl locales net-tools procps vim

# remove unneeded cache and lists
RUN apt autoclean \
    && apt autoremove \
    && rm -rf /var/lib/apt/lists/*

# copy these last so on image rebuilds, the other steps don't need to be re-run if there are changes in these files
COPY ./config /etc/nginx

EXPOSE 80
