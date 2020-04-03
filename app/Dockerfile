#===========
#Build Stage
#===========
FROM bitwalker/alpine-elixir:1.10.2 as build

# Create and set home directory
WORKDIR /opt/app

# Configure required environment
ENV MIX_ENV prod

# Install hex (Elixir package manager)
RUN mix local.hex --force

# Install rebar (Erlang build tool)
RUN mix local.rebar --force

# Copy all dependencies files
COPY mix.* ./

# Install all production dependencies
RUN mix deps.get --only prod

# Compile all dependencies
RUN mix deps.compile

# Copy all application files
COPY . .

# Compile the entire project
RUN mix compile

#Change user
USER default

#Set default entrypoint and command
#ENTRYPOINT [ "/opt/app", "mix run --no-halt" ]
ENTRYPOINT ["sh", "-c", "mix run --no-halt" ]
CMD ["foreground"]
