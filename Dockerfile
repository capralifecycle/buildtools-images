FROM openjdk:8-jre-alpine

ENV SONAR_SCANNER_VERSION 3.0.3.778

RUN apk add --no-cache \
        ca-certificates \
        curl \
    && mkdir -p /opt \
    && curl -fSL https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip -o /opt/sonar-scanner.zip \
    && unzip /opt/sonar-scanner.zip -d /opt \
    && rm /opt/sonar-scanner.zip \
    && ln -s /opt/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner /usr/bin/sonar-scanner \
    \
    # Don't use sonar-scanner embedded jre
    && rm -Rf /opt/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/jre \
    && sed -i 's/use_embedded_jre=true/use_embedded_jre=false/g' /opt/sonar-scanner-${SONAR_SCANNER_VERSION}-linux/bin/sonar-scanner

ENTRYPOINT ["sonar-scanner"]
