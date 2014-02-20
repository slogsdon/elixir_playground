defmodule ElixirPlayground.Repos.Main do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres, env: Mix.env

  @doc "The URL to reach the database."
  def url(:dev) do
    "ecto://elixir_playground:elixir_playground@localhost/elixir_playground_main_dev"
  end

  def url(:test) do
    "ecto://user:pass@localhost/elixir_playground_main_test?size=1&max_overflow=0"
  end

  def url(:prod) do
    "ecto://user:pass@localhost/elixir_playground_main_prod"
  end

  @doc "The priv directory to load migrations and metadata."
  def priv do
    app_dir(:elixir_playground, "priv/main")
  end
end
