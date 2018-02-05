defmodule CodeClicker.Repo.Migrations.CreateUserItem do
  use Ecto.Migration

  def change do
    create table(:user_items) do
      add(:count, :integer)
      add(:user_id, references(:users, on_delete: :nothing))
      add(:item_id, references(:items, on_delete: :nothing))

      timestamps()
    end

    create(index(:user_items, [:user_id]))
    create(index(:user_items, [:item_id]))
  end
end
