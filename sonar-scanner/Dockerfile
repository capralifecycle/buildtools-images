FROM openjdk:8-jre-alpine

ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN apk add --no-cache \
        ca-certificates \
        curl \
    && mkdir -p /opt \
    && curl -fSL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip -o /opt/sonar-scanner.zip \
    && unzip /opt/sonar-scanner.zip -d /opt \
    && rm /opt/sonar-scanner.zip \
    && ln -s /opt/sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner /usr/bin/sonar-scanner

CMD ["sonar-scanner"]
