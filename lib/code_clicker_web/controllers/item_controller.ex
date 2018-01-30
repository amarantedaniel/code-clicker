defmodule CodeClickerWeb.ItemController do
  use CodeClickerWeb, :controller

  alias CodeClicker.Store
  alias CodeClicker.Store.Item

  action_fallback(CodeClickerWeb.FallbackController)

  def index(conn, _params) do
    items = Store.list_items()
    render(conn, "index.json", items: items)
  end

  def create(conn, %{"item" => item_params}) do
    with {:ok, %Item{} = item} <- Store.create_item(item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", item_path(conn, :show, item))
      |> render("show.json", item: item)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Store.get_item!(id)
    render(conn, "show.json", item: item)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Store.get_item!(id)

    with {:ok, %Item{} = item} <- Store.update_item(item, item_params) do
      render(conn, "show.json", item: item)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Store.get_item!(id)

    with {:ok, %Item{}} <- Store.delete_item(item) do
      send_resp(conn, :no_content, "")
    end
  end
end
