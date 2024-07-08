FROM ruby:3.3.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -

RUN apt-get update -qq && apt-get install -y nodejs build-essential postgresql-client yarn \
    curl dirmngr apt-transport-https lsb-release ca-certificates

WORKDIR /var/www/rails-lyrics-site
COPY Gemfile /var/www/rails-lyrics-site/Gemfile
COPY Gemfile.lock /var/www/rails-lyrics-site/Gemfile.lock
RUN bundle install

COPY . /var/www/rails-lyrics-site

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

VOLUME /var/www/rails-lyrics-site/public
VOLUME /var/www/rails-lyrics-site/tmp

CMD ["bundle","exec","puma","-C","config/puma/production.rb","-e","production"]

# EXPOSE 3000
