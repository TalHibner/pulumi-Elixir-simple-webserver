defmodule SimpleWebserver.MixProject do
  use Mix.Project

  def project do
    [
      app: :simple_webserver,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :plug_cowboy],
      mod: {SimpleWebserver.Application, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.1"},
      {:poison, "~> 4.0"},
      {:json, "~> 1.3"}
    ]
  end
end
