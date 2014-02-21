defmodule ElixirPlayground.Models.Snippet do
  use Ecto.Model

  # Take a look at https://github.com/elixir-lang/ecto#models
  # for information about defining fields for your model.
  queryable "snippet" do
    field :key,        :string
    field :snippet,    :string
    field :created_at, :datetime
  end
end
