FROM node:18@sha256:d713deffef463352c4500f003a33de0ee406a213e1bcd96a1082f2e134556158

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
      # groff is dependency for aws cli
      groff \
      jq \
      # Needed for `npm install keytar` for cals-cli.
      libsecret-1-dev \
      python3-pip \
      python3-setuptools \
      python3-wheel \
      zip \
      # For browsers.
      xvfb \
    ; \
    rm -rf /var/lib/apt/lists/*; \
    npm cache clean --force; \
    # Due to build issues on newer AWS EC2 instances this config has to be set
    # to avoid the error: "Error: could not get uid/gid".
    # See related info: https://github.com/npm/npm/issues/20861#issuecomment-400786321
    npm config set unsafe-perm true; \
    pip3 install awscli; \
    \
    # Install sonar-scanner.
    wget https://raw.githubusercontent.com/capralifecycle/buildtools-snippets/master/tools/sonar-scanner/install.sh -O /tmp/sonar-scanner.sh; \
    sh /tmp/sonar-scanner.sh; \
    rm /tmp/sonar-scanner.sh; \
    \
    # Add directory we use a cypress cache in our builds.
    # See test-cypress-docker.sh in webapp-baseline for details.
    mkdir /cypress-cache; \
    chmod 777 /cypress-cache

# Install Google Chrome.

RUN set -eux; \
    cd /tmp; \
    wget -O google-chrome-stable_current_amd64.deb -t 5 "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"; \
    apt-get update; \
    apt install -y ./google-chrome-stable_current_amd64.deb; \
    rm -rf /var/lib/apt/lists/*; \
    rm -rf google-chrome-stable_current_amd64.deb; \
    sed -i 's|HERE/chrome"|HERE/chrome" --disable-setuid-sandbox --no-sandbox|g' \
        /opt/google/chrome/google-chrome; \
    google-chrome --version

RUN set -eux; \
    CHROME_VERSION="$(google-chrome --version)"; \
    export CHROMEDRIVER_RELEASE="$(echo $CHROME_VERSION | sed 's/^Google Chrome //')"; \
    export CHROMEDRIVER_RELEASE=${CHROMEDRIVER_RELEASE%%.*}; \
    CHROMEDRIVER_VERSION=$(curl --silent --show-error --location --fail --retry 4 --retry-delay 5 http://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROMEDRIVER_RELEASE}); \
    curl --silent --show-error --location --fail --retry 4 --retry-delay 5 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"; \
    cd /tmp; \
    unzip chromedriver_linux64.zip; \
    rm -rf chromedriver_linux64.zip; \
    mv chromedriver /usr/local/bin/chromedriver; \
    chmod +x /usr/local/bin/chromedriver; \
    chromedriver --version

# Start xvfb automatically.
ENV DISPLAY :99
RUN set -eux; \
    printf '#!/bin/sh\nXvfb :99 -screen 0 1280x1024x24 &\nexec "$@"\n' > /docker-entrypoint.sh; \
    chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
