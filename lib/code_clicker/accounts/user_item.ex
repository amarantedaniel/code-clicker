defmodule CodeClicker.Accounts.UserItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias CodeClicker.Accounts.UserItem

  schema "user_items" do
    field(:count, :integer)
    belongs_to(:user, CodeClicker.Accounts.User, foreign_key: :user_id)
    belongs_to(:item, CodeClicker.Store.Item, foreign_key: :item_id)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:count])
    |> validate_required([:count])
  end
end
