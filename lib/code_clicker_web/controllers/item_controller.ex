defmodule CodeClickerWeb.ItemController do
  use CodeClickerWeb, :controller

  alias CodeClicker.Store

  action_fallback(CodeClickerWeb.FallbackController)

  def index(conn, _params) do
    items = Store.list_items()
    render(conn, "index.json", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Store.get_item!(id)
    render(conn, "show.json", item: item)
  end
end
