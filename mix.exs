defmodule Issuesex.Mixfile do
  use Mix.Project

  def project do
    [app: :issuesex,
     escript:         escript_config,
     version:         "0.0.1",
     elixir:          "~> 1.2",
     build_embedded:  Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps:            deps]
  end

  def application do
    [ applications: [:logger, :httpoison ] ]
  end

  defp deps do
    [ 
      httpoison:  "~> 0.8",
      poison:     "~> 1.5"
    ]
  end

  defp escript_config do
    [ main_module: Issuesex.CLI ]
  end
end
