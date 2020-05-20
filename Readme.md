## Demo app showcasing two way communication between Ruby on Rails and Phoenix Framework using Sidekiq

Prerequisite:

* Ruby 2.7.1 or later
* Elixir 1.10.3 or later
* Redis

### Ruby on Rails

```
bundle install
bundle exec sidekiq --environment production
```

### Pheonix 

```
mix deps.get
mix phx.server
```
Note: Build a release to run Phoenix framework in production mode.


Hit `localhost:4000/api/messages` endpoint and see logs using `tail -f phoenix_sideque_poc/logs/poc.log` 