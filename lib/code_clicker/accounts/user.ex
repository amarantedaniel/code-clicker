defmodule CodeClicker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias CodeClicker.Accounts.User

  schema "users" do
    field(:company_name, :string)
    field(:password, :string)
    field(:username, :string)

    has_many(:user_items, CodeClicker.Accounts.UserItem)

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :company_name])
    |> validate_required([:username, :company_name])
  end
end
