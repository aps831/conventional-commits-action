FROM alpine:3.20@sha256:eddacbc7e24bf8799a4ed3cdcfa50d4b88a323695ad80f317b6629883b2c2a78
HEALTHCHECK NONE
RUN apk add git --no-cache
ARG VERSION=6.0.1
RUN wget -O conventional_commits_next_version.zip https://gitlab.com/DeveloperC/conventional_commits_next_version/-/jobs/artifacts/bin-$VERSION/download?job=release-binary-compiling-x86_64-linux-musl \
    && unzip conventional_commits_next_version.zip \
    && mv conventional_commits_next_version /usr/local/bin/conventional_commits_next_version \
    && chmod +x /usr/local/bin/conventional_commits_next_version \
    && rm -f conventional_commits_next_version.zip
COPY entrypoint.sh /entrypoint.sh
USER 1001:1001
ENTRYPOINT ["/entrypoint.sh"]
