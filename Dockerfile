FROM debian:stable-slim

LABEL "com.github.actions.name"="WordPress Plugin Deploy"
LABEL "com.github.actions.description"="Deploy to the WordPress Plugin Repository"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

LABEL maintainer="Joonas Loueranta <joonas.loueranta@op.fi>"
LABEL version="1.2.1"
LABEL repository="https://github.com/OPMerchantServices/action-wordpress-plugin-deploy"

RUN apt-get update \
	&& apt-get install -y subversion rsync git \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& git config --global user.email "joonas.loueranta@op.fi" \
	&& git config --global user.name "Joonas Loueranta"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
