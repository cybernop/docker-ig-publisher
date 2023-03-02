ARG JAVA_VERSION=17

FROM eclipse-temurin:${JAVA_VERSION}-jdk-alpine
ARG SUSHI_VERSION=3.0.0-beta.1

RUN apk add --update \
    curl \
    bash \
    graphviz \
    nodejs \
    npm \
    jekyll

WORKDIR /usr/share/ig

RUN wget https://raw.githubusercontent.com/HL7/ig-publisher-scripts/main/_updatePublisher.sh \
    && chmod a+x _updatePublisher.sh

RUN npm install -g fsh-sushi@$SUSHI_VERSION
RUN wget https://github.com/plantuml/plantuml/releases/latest/download/plantuml.jar

COPY entrypoint.sh .
ENTRYPOINT [ "./entrypoint.sh" ]
