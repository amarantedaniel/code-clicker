defmodule CodeClickerWeb.UserView do
  use CodeClickerWeb, :view
  alias CodeClickerWeb.UserView

  def render("index.json", %{users: users}) do
    render_many(users, UserView, "user.json")
  end

  def render("show.json", %{user: user}) do
    render_one(user, UserView, "user.json")
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      username: user.username,
      password_hash: user.password_hash,
      company_name: user.company_name,
      lines_count: user.lines_count
    }
  end

  def render("show_token.json", %{token: token}) do
    %{token: token}
  end
end
