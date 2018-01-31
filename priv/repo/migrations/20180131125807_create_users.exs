defmodule CodeClicker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :password, :string
      add :company_name, :string

      timestamps()
    end

  end
end
