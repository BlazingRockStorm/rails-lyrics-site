FROM ruby:3.1.2

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update -qq && apt-get install -y nodejs build-essential postgresql-client yarn \
    curl dirmngr apt-transport-https lsb-release ca-certificates

WORKDIR /rails-lyrics-site
COPY Gemfile /rails-lyrics-site/Gemfile
COPY Gemfile.lock /rails-lyrics-site/Gemfile.lock
RUN bundle install
