defmodule CodeClicker.Repo.Migrations.AddLinesToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:lines_count, :integer)
    end
  end
end
