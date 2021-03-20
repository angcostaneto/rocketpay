# Use an official Elixir runtime as a parent image
FROM elixir:1.11.3

RUN apt-get update && \
  apt-get install -y postgresql-client

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force
RUN mix local.rebar --force

RUN mix deps.unlock --all
RUN mix deps.update --all

# Compile the project
RUN mix do compile

CMD ["/app/entrypoint.sh"]