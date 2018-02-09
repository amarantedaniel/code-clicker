defmodule CodeClicker.Accounts do
  import Ecto.Query, warn: false
  alias CodeClicker.Repo

  alias CodeClicker.Accounts.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by_username!(username) do
    Repo.one(from(u in User, where: u.username == ^username))
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.signup_changeset(attrs)
    |> Repo.insert()
  end

  def save_progress(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  # def save_progress(user, ble) do
  #   user
  # end

  # Not used:

  # def update_user(%User{} = user, attrs) do
  #   user
  #   |> User.changeset(attrs)
  #   |> Repo.update()
  # end

  # def delete_user(%User{} = user) do
  #   Repo.delete(user)
  # end

  # def change_user(%User{} = user) do
  #   User.changeset(user, %{})
  # end
end
