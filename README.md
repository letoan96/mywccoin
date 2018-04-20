# WCCoin web app

Web frontend for betting system using WCCoin

## System requirement

- Ruby
- NodeJS
- PostgreSQL

## Development

### Install PostgreSQL

### Install NodeJS

### Install Ruby

Install `rbenv`:

```sh
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src

echo 'export RBENV_ROOT="$HOME/.rbenv"' >> ~/.bash_profile
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> ~/.bash_profile

echo -e 'if command -v rbenv 1>/dev/null 2>&1; then\n  eval "$(rbenv init -)"\nfi' >> ~/.bash_profile

source ˜/.bash_profile
```

Install `ruby-build`:

```sh
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

Install Ruby:

```sh
rbenv install 2.5.1

```

### Initialize the database

```sh
rbenv local 2.5.1

gem install bundler
bundle install

gem install rails
rails db:create
rails db:migrate
rails db:seed
```

### Compile Solidity contract

```sh
npm install -g truffle
npm install
truffle compile
truffle deploy
```

### Start the development server

```sh
rails s
``
