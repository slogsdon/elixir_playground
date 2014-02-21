defmodule ElixirPlayground.Controllers.Api do
  use Sugar.Controller
  alias ElixirPlayground.Eval
  alias ElixirPlayground.SecureRandom

  def run(conn, []) do
    conn = conn |> fetch_params

    unless conn.params["snippet"] do
      halt! conn
    end

    result = Eval.eval conn.params["snippet"]
    json conn, result
  end

  def save(conn, []) do
    conn = conn |> fetch_params

    unless conn.params["snippet"] do
      halt! conn
    end

    snippet = Queries.Snippet.create [
      key: SecureRandom.urlsafe_base64,
      snippet: conn.params["snippet"]
    ]

    json conn, [status: "redirect", location: "/s/" <> snippet.key]
  end
end