defmodule CodeClickerWeb.ItemView do
  use CodeClickerWeb, :view
  alias CodeClickerWeb.ItemView

  def render("index.json", %{items: items}) do
    render_many(items, ItemView, "item.json")
  end

  def render("show.json", %{item: item}) do
    render_one(item, ItemView, "item.json")
  end

  def render("item.json", %{item: item}) do
    %{
      id: item.id,
      name: item.name,
      base_price: item.base_price,
      price_multiplier: item.price_multiplier,
      clicks_per_second: item.clicks_per_second
    }
  end
end
