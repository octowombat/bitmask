defmodule Bitmask.MixProject do
  use Mix.Project

  def project do
    [
      app: :bitmask,
      version: "0.3.2",
      elixir: "~> 1.15",
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),

      # Docs
      name: "Bitmask",
      source_url: "https://github.com/jaypeet/bitmask",
      description: description(),
      package: package(),
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore.exs",
        plt_add_apps: [:mix, :ex_unit],
        plt_add_deps: :app_tree,
        plt_core_path: "priv/plts/core"
      ],
      docs: [
        main: "Bitmask",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      # Dev and test libs and apps
      {:bypass, "~> 2.1"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.28.0", only: :dev, runtime: false},

      # Runtime libs and apps
      {:ecto, "~> 3.11", optional: true}
    ]
  end

  defp description() do
    "A use macro for automatically generating a Bitmask from a collection of atoms."
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/jaypeet/bitmask"}
    ]
  end
end
