defmodule CodeClickerWeb.UserController do
  use CodeClickerWeb, :controller

  alias CodeClicker.Accounts
  alias CodeClicker.Accounts.User

  action_fallback(CodeClickerWeb.FallbackController)

  def login(conn, %{"username" => username, "password" => password}) do
    with {:ok, user} <- Accounts.get_user_by_username!(username) |> check_password(password) do
      conn
      |> put_status(:ok)
      |> render("show.json", user: user)
    end
  end

  def check_password(user, password) do
    case Comeonin.Bcrypt.checkpw(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, :not_found}
    end
  end

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, user_params) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("show.json", user: user)
    end
  end
end
