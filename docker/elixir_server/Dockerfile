ARG ERLANG_VERSION

FROM erlang:${ERLANG_VERSION}

# Locale and setting dev enviroment
ENV MIX_ENV=dev

# Setting appropriate locale
ENV LANG=C.UTF-8

RUN apt-get update && apt-get install -y --no-install-recommends locales \
    && echo $LANG UTF-8 > /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=$LANG

# Tools and dependencies
RUN apt-get update -y
RUN apt-get install --no-install-recommends --no-install-suggests -q -y \
    ca-certificates \
	curl \
    git \
	inotify-tools \
	iputils-ping \
    make \
    vim

# Downloading and installing Elixir
ARG ELIXIR_VERSION

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/archive/v${ELIXIR_VERSION}.tar.gz" \
	&& curl -fSL -o elixir-src.tar.gz $ELIXIR_DOWNLOAD_URL \
	&& mkdir -p /usr/local/src/elixir \
	&& tar -xzC /usr/local/src/elixir --strip-components=1 -f elixir-src.tar.gz \
	&& rm elixir-src.tar.gz \
	&& cd /usr/local/src/elixir \
	&& make install clean

# Installing Phoenix
ARG PHOENIX_VERSION

# versions older than 1.3
RUN if mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new-${PHOENIX_VERSION}.ez --force; \
	then echo "old version installed" else echo "new version  installation discarded"; fi

# newer versions
RUN if mix archive.install hex phx_new ${PHOENIX_VERSION}; \
	then echo "new version installed"; else echo "old version installation discarded"; fi

# Installing node (and npm)
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

# Work directory
WORKDIR /var/www/

# Keeping container running
# (It must be running an app in foreground to work in deattached mode)
CMD tail -f /dev/null
