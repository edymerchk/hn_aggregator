# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :hn_aggregator, HnAggregatorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1mf66Ep14hPY6F6Z/xdpY3i31+BjMP4xQ89YNPLXE0AG+1jAmUcVxbMF0vcJRS5O",
  render_errors: [view: HnAggregatorWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HnAggregator.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
