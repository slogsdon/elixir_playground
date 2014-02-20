defmodule Router do
  use Sugar.Router

  # Uncomment the following line for request logging,
  # and add 'applications: [:exlager],' to the application
  # Keyword list in your mix.exs
  # plug Plugs.Logger

  # Define your routes here
  get "/", ElixirPlayground.Controllers.Main, :index
  post "/run", ElixirPlayground.Controllers.Main, :run
  post "/save", ElixirPlayground.Controllers.Main, :save
  get "/s/:id", ElixirPlayground.Controllers.Main, :show
end
