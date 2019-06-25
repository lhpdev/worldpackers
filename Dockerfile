FROM ruby:2.5
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*postgresql-client
RUN mkdir /worldpackers
WORKDIR /worldpackers
COPY Gemfile /worldpackers/Gemfile
COPY Gemfile.lock /worldpackers/Gemfile.lock
RUN bundle install
COPY . /worldpackers

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
