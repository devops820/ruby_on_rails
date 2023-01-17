# Ruby on Rails

## Preqs

### Install Dependencies

- `sudo apt-get install build-essential`
- `sudo apt-get install libz-dev libssl-dev zlib1g-dev sqlite3 libsqlite3-dev`
- `sudo apt-get install git curl`

## Install Nodejs & Yarn

### Install Latest version of NodeJs

- `curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -`
- `sudo apt-get install nodejs`
- `node -v`

### Install Latest version of Yarn

- `curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -`
- `echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list`
- `sudo apt-get update && sudo apt-get install yarn`
- `yarn -v`

## Install rbenv

### Install rbenv
- `curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash`

### Add rbenv to the path
- `echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
- `echo 'eval "$(rbenv init - bash)"' >> ~/.bashrc`
- `exec $SHELL`

### Test rbenv is installed correctly
- ` curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-doctor | bash`


## Install ruby

- `rbenv install -l`
- `rbenv install 3.0.2 -v`
- `rbenv global 3.0.2`
- `ruby -v`
- `gem install bundler`
- `gem install rails`
- `rails -v`

## References
- [Install Ruby on Rails on Ubuntu](https://www.vultr.com/docs/installing-ruby-on-rails-on-ubuntu-20-04?utm_source=performance-max-apac&utm_medium=paidmedia&obility_id=16876059738&utm_adgroup=&utm_campaign=&utm_term=&utm_content=&gclid=Cj0KCQiAtvSdBhD0ARIsAPf8oNkuGaEw4YhrP9O0TEnB95h_LPSyTGK8OwXh08sVz3jk1A_Pl1WuQQ8aAmFhEALw_wcB)
- [Install mysql-server on ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)