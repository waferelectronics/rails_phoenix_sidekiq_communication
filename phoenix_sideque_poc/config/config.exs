# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :phoenix_sideque_poc, PhoenixSidequePocWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yGHTlFKLw7S/x6aVa67CdL6Zr4oY/SYeuqoQbASZYFf4grAPFZH4hxQR4Cr1Qaww",
  render_errors: [view: PhoenixSidequePocWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PhoenixSidequePoc.PubSub,
  live_view: [signing_salt: "iPHOutsx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :exq,
  name: Exq,
  host: "127.0.0.1",
  port: 6379,
  namespace: "poc",
  concurrency: 100,
  queues: ["outgoing_message"],
  poll_timeout: 50,
  scheduler_poll_timeout: 200,
  scheduler_enable: true,
  max_retries: 25,
  mode: :default,
  shutdown_timeout: 5000

config :logger, :warn,
  path: "logs/poc.log",
  level: :warn

config :logger,
  backends: [{LoggerFileBackend, :warn}]