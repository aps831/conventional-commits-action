FROM alpine:3.20@sha256:0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5
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
