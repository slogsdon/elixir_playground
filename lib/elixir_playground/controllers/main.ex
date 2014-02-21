defmodule ElixirPlayground.Controllers.Main do
  use Sugar.Controller
  alias ElixirPlayground.Queries

  def index(conn, []) do
    {:ok,html} = Templates.Engines.EEx.render("lib/elixir_playground/views/main/index.html.eex", [])
    raw conn |> resp(200, html)
  end

  def show(conn, args) do
    snippet = Queries.Snippet.by_key args[:key]
    conn = conn |> Plug.Connection.assign(:snippet, snippet)
    {:ok,html} = Templates.Engines.EEx.render("lib/elixir_playground/views/main/index.html.eex", [])
    raw conn |> resp(200, html)
  end
end
