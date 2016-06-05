## BUILDING
##   (from project root directory)
##   $ docker build -t nimerfarahty-farahty .
##
## RUNNING
##   $ docker run -p 9000:9000 nimerfarahty-farahty
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu:14.04-r07

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="lvbow7m" \
    STACKSMITH_STACK_NAME="nimerfarahty/farahty" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install php-7.0.7-0 --checksum 21e4b197b1808a04cb1d81702884b9ac9687387e63c8e30d311a4084f52e5d11

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# PHP base template
COPY . /app
WORKDIR /app

CMD ["php", "-a"]
