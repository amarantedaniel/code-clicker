defmodule CodeClicker.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias CodeClicker.Accounts.User

  schema "users" do
    field(:company_name, :string)
    field(:username, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:lines_count, :integer, default: 0)

    has_many(:user_items, CodeClicker.Accounts.UserItem)

    timestamps()
  end

  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :password, :company_name])
    |> validate_required([:username, :password])
    |> put_encrypted_password
  end

  defp put_encrypted_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))

      _ ->
        changeset
    end
  end
end
