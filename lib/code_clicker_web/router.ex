defmodule CodeClickerWeb.Router do
  use CodeClickerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", CodeClickerWeb do
    pipe_through :api
  end
end
