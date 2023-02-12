FROM ruby:2.6
ENV APP_ROOT /recipe_share

WORKDIR $APP_ROOT

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN gem install bundler
RUN bundle install

COPY . $APP_ROOT/

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]