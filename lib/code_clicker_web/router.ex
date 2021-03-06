defmodule CodeClickerWeb.Router do
  use CodeClickerWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", CodeClickerWeb do
    pipe_through(:api)
    resources("/items", ItemController, only: [:index, :show])
    resources("/users", UserController, only: [:index])
    post("/users/login", UserController, :login)
    post("/users/signup", UserController, :signup)
    post("/users/save", UserController, :save)
  end
end
