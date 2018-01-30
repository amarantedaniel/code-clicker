# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :code_clicker,
  ecto_repos: [CodeClicker.Repo]

# Configures the endpoint
config :code_clicker, CodeClickerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "QHOVPLLoKxQNiQBAOo9QEj3yhw9Y+GBFPkyUfto0ldRbtyBFAGTrzi1ZBL+yqf0f",
  render_errors: [view: CodeClickerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: CodeClicker.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"