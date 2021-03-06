defmodule Data.MixProject do
  use Mix.Project

  def project do
    [
      app: :data,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # # Run "mix help compile.app" to learn about applications.
  # def application do
  #   [
  #     extra_applications: [:logger, :postgrex, :ecto],
  #     mod: {Data.Application, []}
  #   ]
  # end

   # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:logger, :postgrex, :ecto],
      mod: {Data.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      # {:sibling_app_in_umbrella, in_umbrella: true}
      {:ecto, "~> 3.6"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, "~> 0.15.8"}
    ]
  end

  defp aliases do
    [
      init: ["ecto.create", "ecto.migrate", "run priv/repo/seed.exs"]
    ]
  end
end
