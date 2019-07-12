FROM maven:3.6.1-ibmjava-alpine as maven

ARG GIT_COMMIT

WORKDIR /usr/share/maven

RUN apk add --no-cache git \
  && mkdir -p build/ \
  && cd build/ \
  && git clone https://github.com/binlab/hashicorp-vault-plugin.git . \
  && sed -i -e "s@SNAPSHOT@${GIT_COMMIT::7}@g" pom.xml \ 
  && cat pom.xml \
  && mvn package

FROM scratch

COPY --from=maven /usr/share/maven/build/target/hashicorp-vault-plugin.hpi /hashicorp-vault-plugin.hpi