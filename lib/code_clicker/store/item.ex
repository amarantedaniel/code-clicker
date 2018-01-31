defmodule CodeClicker.Store.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias CodeClicker.Store.Item

  schema "items" do
    field(:base_price, :integer)
    field(:clicks_per_second, :integer)
    field(:name, :string)
    field(:price_multiplier, :float)

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :base_price, :price_multiplier, :clicks_per_second])
    |> validate_required([:name, :base_price, :price_multiplier, :clicks_per_second])
  end
end
