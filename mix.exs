defmodule Homework.MixProject do
  use Mix.Project

  def project do
    [
      app: :homework,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:hound, "~> 1.1"},
      {:bypass, "~> 2.1"},
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.8"},
      {:ranch, "~> 1.8"},
      {:ex_doc, "> 0.0.0", only: :dev},
      {:espec, "~> 1.6", only: [:dev, :test]},
      {:mint, "~> 1.1", only: :test},
      {:httpoison, "~> 1.8"},
      {:hackney, "~> 1.17"},
      {:exjsx, "~> 4.0"},
      {:json, "~> 1.4"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
