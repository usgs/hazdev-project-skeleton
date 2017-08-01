FROM usgs/hazdev-base-images:latest-php-dev
ARG APP_NAME

# copy distribution
COPY ./dist/ /data/www/apps/${APP_NAME}/
COPY ./src/htdocs/_config.inc.php /data/www/html/_config.inc.php

# run pre-install
RUN /data/www/apps/${APP_NAME}/lib/pre-install --non-interactive
