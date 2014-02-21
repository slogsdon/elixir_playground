defmodule ElixirPlayground.Queries.Snippet do
  import Ecto.Query

  # Take a look at https://github.com/elixir-lang/ecto#query
  # for information about defining queries for your models.
  def all do
    query = from s in ElixirPlayground.Models.Snippet,
            select: s
    ElixirPlayground.Repos.Main.all(query)
  end

  def by_key(key) do
    query = from s in ElixirPlayground.Models.Snippet,
            where: s.key == ^key,
            select: s
    ElixirPlayground.Repos.Main.all(query)
  end

  def create(snippet) do
    {{year, month, day}, {hour, min, sec}} = Date.universal Date.now
    now = Ecto.DateTime[year: year, month: month, day: day, hour: hour, min: min, sec: sec]

    snippet = snippet ++ [created_at: now]
    ElixirPlayground.Models.Snippet.new(snippet)
      |> ElixirPlayground.Repos.Main.create
  end
end
