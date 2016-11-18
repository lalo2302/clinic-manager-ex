# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :clinic_app,
  ecto_repos: [ClinicApp.Repo]

# Configures the endpoint
config :clinic_app, ClinicApp.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Mpk6olNA9hcMqqGO7oPsylPFohKL0FlqNRYHcOJO1fc1Rn7M6tVnpDuQw1WO2+zJ",
  render_errors: [view: ClinicApp.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ClinicApp.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
