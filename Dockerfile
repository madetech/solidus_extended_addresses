FROM madetech/rails-deps

RUN mkdir -p /app
WORKDIR /app
COPY lib/solidus_extended_addresses/version.rb ./lib/solidus_extended_addresses/version.rb
COPY Gemfile solidus_extended_addresses.gemspec ./
RUN bundle install --jobs 20 --retry 5
EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
