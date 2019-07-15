FROM marceloagmelo/nodejs-8.9.1:1.0.0.RELEASE

USER root

ADD app $APP_HOME
COPY Dockerfile $IMAGE_SCRIPTS/Dockerfile
ADD scripts $IMAGE_SCRIPTS_HOME

RUN cd $APP_HOME && npm install && \
    chown -R nodejs:nodejs $APP_HOME && \
    chown -R nodejs:nodejs $IMAGE_SCRIPTS_HOME

USER nodejs

WORKDIR $IMAGE_SCRIPTS_HOME
