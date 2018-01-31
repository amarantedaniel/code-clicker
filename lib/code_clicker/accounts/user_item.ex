defmodule CodeClicker.Accounts.UserItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_items" do
    field(:count, :integer, default: 0)
    belongs_to(:user, CodeClicker.Accounts.User, foreign_key: :user_id)
    belongs_to(:item, CodeClicker.Store.Item, foreign_key: :item_id)

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:count])
    |> validate_required([:count])
  end
end
