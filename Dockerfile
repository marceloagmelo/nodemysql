FROM marceloagmelo/nodejs-8.9.1:1.0.0.RELEASE

ADD app $APP_HOME
COPY Dockerfile $IMAGE_SCRIPTS/Dockerfile

RUN chown -R nodejs:nodejs $APP_HOME && \
    chown -R nodejs:nodejs $IMAGE_SCRIPTS
