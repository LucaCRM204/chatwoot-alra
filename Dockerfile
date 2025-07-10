# Dockerfile para Chatwoot deployable en Railway
FROM ruby:3.2.2

RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && apt-get update -qq \
  && apt-get install -y nodejs postgresql-client yarn imagemagick libvips

RUN gem install bundler -v 2.5.16

WORKDIR /app
COPY . .

RUN bundle install
RUN yarn install
RUN yarn build

ENV RAILS_ENV=production
ENV NODE_ENV=production

RUN bundle exec rails assets:precompile

CMD ["./start.sh"]
