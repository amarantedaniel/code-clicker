defmodule CodeClicker.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :base_price, :integer
      add :price_multiplier, :float
      add :clicks_per_second, :integer

      timestamps()
    end

  end
end
