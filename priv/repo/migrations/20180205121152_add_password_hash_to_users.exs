defmodule CodeClicker.Repo.Migrations.AddPasswordHashToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:password_hash, :string)
      remove(:password)
    end
  end
end
