defmodule CodeClickerWeb.Router do
  use CodeClickerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", CodeClickerWeb do
    pipe_through(:api)
    resources("/items", ItemController, only: [:index, :show])
    resources("/users", UserController, only: [:create, :index])
    post("/users/login", UserController, :login)
  end
end
