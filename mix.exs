defmodule ClinicApp.Mixfile do
  use Mix.Project

  def project do
    [app: :clinic_app,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {ClinicApp, []},
     applications: [:faker, :phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext, :tds_ecto, :ecto, :ex_machina, :detergentex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web", "test/support"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:faker, "~> 0.7"},
     {:phoenix, "~> 1.2.1"},
     {:phoenix_pubsub, "~> 1.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:tds_ecto, "~> 1.0.2"},
     {:ecto, "~> 1.1.8"},
     {:ex_machina, git: "https://github.com/lalo2302/ex_machina.git"},
     {:erlsom, github: "willemdj/erlsom"},
     {:detergentex, "0.0.5"}
   ]
  end
end
