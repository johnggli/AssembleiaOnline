<h1 align="center"><span><img src="https://avatars2.githubusercontent.com/u/17027663?s=280&v=4" width="100" /></span><br/>Assembléia Treinamento</h1>
<h3 align="center">Project developed by the interns in order to improve and learn more about ruby on rails.</h3>

<p align="center">
  <img alt="Ruby version" src="https://img.shields.io/badge/ruby-2.6.5-informational?logo=ruby&color=%23e65100">
  
  <img alt="Rails version" src="https://img.shields.io/badge/rails-6.0.3-informational?logo=ruby-on-rails&color=%23e65100">
  
  <img alt="Yarn version" src="https://img.shields.io/badge/yarn-1.22.4-informational?logo=yarn&color=%23e65100">
</p>

<p align="center">
  <a href="#bulb-about-the-project">About the project</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#rocket-technologies">Technologies</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#computer-getting-started">Getting started</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#boy-developers">Developers</a>
</p>

---

## :bulb: About the project

- This project is about a system for managing condominium assemblies, in which residents (users) can register, through a pre-registration, and vote on assembly topics. The system also provides an option for the user to view the voting history of the assembly, in addition to having an administrative part, which manages the system.

- Deploy: https://assembleia-online.herokuapp.com

## :rocket: Technologies

Technologies that were used to develop this project

- [Ruby 2.6.5](https://www.ruby-lang.org/pt/)
- [Rails 6.0.3](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Bootstrap 4.5](https://getbootstrap.com/)
- [JQuery 3.5.1](https://jquery.com/)

## :computer: Getting started

### Requirements

- [Install RVM](https://rvm.io/)

**Install Ruby**

```bash
$ rvm install 2.6.5
```

**Install Bundler**

```bash
$ gem install bundler
```

**Install Gems**

```bash
$ bundle install
```

**Install PostgreSQL**

```bash
# Ubuntu
$ sudo apt-get install postgresql postgresql-contrib libpq-dev

# MacOS
$ brew install postgresql

# To make it easier to manage your development databases,
# create a PostgreSQL user with the same name as your OS user
$ sudo -u postgres createuser -rds <username>

# Then, create a database with the same name as your user
$ createdb <username>

# Finally, you can access the PostgreSQL console with the psql command
$ psql
psql (9.4.2)
Type "help" for help.

user=#
```

**Install node_modules dependencies**

```bash
$ yarn install
```

**Run the migrations**

```bash
$ rails db:create db:migrate db:seed

# Or simply run the rake task
$ rails dev:setup
```

**Run the server**

```bash
$ rails server
```

---

## :boy: Developers
- [John Emerson](https://johnemerson1406.github.io/linktree/)
- [Pedro Monteiro](https://github.com/pvfm)

---

### :star2: Extras
- [Shields.io](https://shields.io/)
- [Github Emojis](https://gist.github.com/rxaviers/7360908)
