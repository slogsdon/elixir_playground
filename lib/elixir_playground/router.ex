defmodule Router do
  alias ElixirPlayground.Controllers.Main
  use Sugar.Router, plugs: [
      { Plugs.HotCodeReload, [] },
      { Plugs.StaticFiles, url: "/static", path: "priv/static" },

      # Uncomment the following line for session store
      # { Plugs.Session, name: "_sugar_session", adapter: Plugs.Session.Adapters.Ets },

      # Uncomment the following line for request logging,
      # and add 'applications: [:exlager],' to the application
      # Keyword list in your mix.exs
      # { Plugs.Logger, [] }
  ]

  # Define your routes here
  # Main Routes
  get  "/",       Main, :index
  get  "/s/:key", Main, :show
  # Api Routes
  post "/run",    Api,  :run
  post "/save",   Api,  :save
end
