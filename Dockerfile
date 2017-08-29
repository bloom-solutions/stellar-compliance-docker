FROM ubuntu:16.10
MAINTAINER Ramon Tayag <ramon.tayag@gmail.com>

RUN apt-get update -qq && \
  apt-get upgrade -y && \
  apt-get install -y ca-certificates curl && \
  rm -rf /var/lib/apt/lists/*
ENV APP_DIR=/app
ENV PATH=$APP_DIR:$PATH
RUN mkdir $APP_DIR
WORKDIR $APP_DIR

ENV COMPLIANCE_VERSION=v0.0.25
ENV COMPLIANCE_BASENAME=compliance-$COMPLIANCE_VERSION-linux-amd64
ENV COMPLIANCE_FILENAME=$COMPLIANCE_BASENAME.tar.gz

RUN curl -L https://github.com/stellar/bridge-server/releases/download/$COMPLIANCE_VERSION/$COMPLIANCE_FILENAME -o $COMPLIANCE_FILENAME && \
  tar zxf $COMPLIANCE_FILENAME && \
  mv $COMPLIANCE_BASENAME/compliance /usr/local/bin && \
  rm $COMPLIANCE_FILENAME && \
  rm -r $COMPLIANCE_BASENAME

ADD app $APP_DIR

ENV CONFIG_FILE_PATH=/config/compliance.cfg

CMD ["/app/entrypoint.sh", "compliance"]
