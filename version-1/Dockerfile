ARG RUBY_VERSION=2.4.9

FROM ruby:${RUBY_VERSION}-alpine

ARG RAILS_ENV=development
ARG REPO=https://github.com/andrewnk/book_reminder.git
ARG REPO_BRANCH=master

COPY ./docker-entrypoint.sh /usr/local/bin/

WORKDIR /usr/src/app

RUN apk add --no-cache \
    build-base \
    git \
    nodejs \
    sqlite-dev \
    'su-exec>=0.2' \
    tzdata && \
    addgroup -S app && adduser -S app -G app -u 1000 && \
    echo "Cloning ${REPO} | Branch ${REPO_BRANCH}" && \
    git clone -b ${REPO_BRANCH} --depth 1 ${REPO} . && \
    chmod +x /usr/local/bin/docker-entrypoint.sh && \
    chmod +x -R ./bin/ && \
    ./bin/setup && \
    ./bin/rake db:migrate

# Replace the env variable secret with a dockerized secret
RUN sed -ir "s|ENV\[\"SECRET_KEY_BASE\"\]|File.read(\"/run/secrets/secret_key_base\").strip|" /usr/src/app/config/secrets.yml

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
