defmodule CodeClickerWeb.UserController do
  use CodeClickerWeb, :controller

  alias CodeClicker.Accounts
  alias CodeClicker.Accounts.User
  alias CodeClicker.Accounts.Guardian

  action_fallback(CodeClickerWeb.FallbackController)

  def login(conn, %{"username" => username, "password" => password}) do
    with {:ok, user} <- Accounts.get_user_by_username!(username) |> check_password(password),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:ok)
      |> render("show_token.json", token: token)
    end
  end

  def check_password(user, password) do
    case Comeonin.Bcrypt.checkpw(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, :not_found}
    end
  end

  def signup(conn, user_params) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("show_token.json", token: token)
    end
  end

  # This is for debug only
  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end
end
