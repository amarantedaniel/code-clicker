defmodule CodeClicker.Store do
  import Ecto.Query, warn: false
  alias CodeClicker.Repo

  alias CodeClicker.Store.Item

  def list_items do
    Repo.all(Item)
  end

  def get_item!(id), do: Repo.get!(Item, id)
end
