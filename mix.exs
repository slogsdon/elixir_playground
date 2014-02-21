defmodule ElixirPlayground.Mixfile do
  use Mix.Project

  def project do
    [ app: :elixir_playground,
      version: "0.0.1",
      elixir: "~> 0.12.4",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [mod: { ElixirPlayground, [] }]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      { :sugar, github: "sugar-framework/sugar" },
      { :"elixir-datetime", github: "alco/elixir-datetime" },
    ]
  end
end
