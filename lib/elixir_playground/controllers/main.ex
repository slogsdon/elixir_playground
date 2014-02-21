defmodule ElixirPlayground.Controllers.Main do
  use Sugar.Controller

  def index(conn, []) do
    {:ok,html} = Templates.Engines.EEx.render("lib/elixir_playground/views/main/index.html.eex", [])
    raw conn |> resp(200, html)
  end

  def run(conn, []) do
    conn = conn |> fetch_params

    unless conn.params["snippet"] do
      halt! conn
    end

    result = ElixirPlayground.Eval.eval conn.params["snippet"]
    json conn, [result: result]
  end

  def save(conn, []) do

    id = "1"
    redirect conn, "/show/" <> id, status: 302
  end

  def show(conn, [id]) do
    snippet = id

    conn = conn.assign :snippet, snippet
    render conn, "show.html"
  end
end
