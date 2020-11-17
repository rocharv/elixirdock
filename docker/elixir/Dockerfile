FROM erlang:21-slim

# Setting for specific Elixir version
# (note: depending on Elixir version, you must choose a diferent Erlang image as well)
ENV ELIXIR_VERSION="1.6.6" \
	LANG=C.UTF-8 \
	MIX_ENV=dev \
	PHOENIX_VERSION="1.2.5"

# Downloading and installing Elixir
RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/v${ELIXIR_VERSION}.tar.gz" \
	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
	&& mkdir -p /usr/local/src/elixir \
	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
	&& rm elixir-src.tar.gz \
	&& cd /usr/local/src/elixir \
	&& make install clean

# Installing Phoenix
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new-${PHOENIX_VERSION}.ez --force

# Work directory
WORKDIR /var/www/

# Keeping container running
# (It must be running an app in foreground to work in deattached mode)
CMD tail -f /dev/null
