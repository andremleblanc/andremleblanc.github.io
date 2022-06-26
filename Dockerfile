FROM ruby:3.1.1
RUN apt update

# Setup specific version of ruby
# RUN apt install -y rbenv
# RUN echo eval "$(rbenv init -)" >> ~/.zshrc
# $ mkdir -p "$(rbenv root)"/plugins
# $ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
# rbenv-install ruby-3.1.1


# Setup zsh for better tty experience
# RUN apt install -y curl git zsh
# RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# ENTRYPOINT [ "/bin/zsh" ]

# Install specific version of ruby
# WORKDIR /opt
# RUN apt install -y make wget
# RUN wget -O ruby-install-0.8.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.3.tar.gz
# RUN tar -xzvf ruby-install-0.8.3.tar.gz
# WORKDIR /opt/ruby-install-0.8.3/
# RUN make install
# RUN ruby-install ruby 3.1.1

# Setup ruby for use
# WORKDIR /opt
# RUN wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
# RUN tar -xzvf chruby-0.3.9.tar.gz
# WORKDIR /opt/chruby-0.3.9/
# RUN make install
# RUN echo 'source /usr/local/share/chruby/chruby.sh' >> ~/.zshrc
# RUN echo 'chruby ruby-3.1.1' >> ~/.zshrc

# Setup app
WORKDIR /usr/src
COPY . .
RUN bundle install
CMD [ "bundle", "exec", "jekyll", "serve" ]
