FROM ruby:2.3.1
#FROM ruby:2.3.1-alpine

RUN apt-get update -qq && apt-get install -y build-essential sqlite3 libsqlite3-dev nodejs
#RUN apk add --no-cache linux-headers sqlite 

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

expose 3000

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]
