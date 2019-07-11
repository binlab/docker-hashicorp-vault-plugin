FROM maven:3.6.1-ibmjava-alpine as maven

ARG SOURCE_COMMIT
ARG GIT_COMMIT

RUN echo "${SOURCE_COMMIT}"
RUN echo "${GIT_COMMIT}"