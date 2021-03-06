defmodule Gma.Mixfile do
  use Mix.Project

  def project do
    [app: :gma,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :dev,
     start_permanent: Mix.env == :dev,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :cowboy, :plug, :poison, :mariaex, :ecto, :exrm],
     mod: {Gma, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 0.12"},
     {:mariaex, "~> 0.6.5"},
     {:ecto, "~> 1.1.5"},
     {:poison, "~> 1.5.2"},
     {:exrm, "~> 1.0"}
     ]
  end
end
