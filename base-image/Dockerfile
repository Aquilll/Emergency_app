FROM ubuntu:16.04

RUN apt-get update -qq && apt-get install -y build-essential nodejs npm git curl libxslt-dev libxml2-dev postgresql postgresql-client libpq5 libpq-dev libsqlite3-dev libfreetype6 libfontconfig libreadline-dev vim wget libfreetype6 libfontconfig bzip2 redis-tools
RUN mkdir -p /emergency

# Install rbenv
RUN git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get install -y nodejs

RUN npm install -g yarn

# Install supervisor
RUN apt-get install -y supervisor


# install ruby-build
RUN mkdir /usr/local/rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
ENV RBENV_ROOT /usr/local/rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN rbenv install 2.3.3
RUN bash -l -c 'rbenv global 2.3.3; gem install bundler --no-ri --no-rdoc; rbenv rehash'

# clean up
RUN apt-get autoremove -y  && \
  apt-get clean all

# Setup project dir
WORKDIR /emergency
