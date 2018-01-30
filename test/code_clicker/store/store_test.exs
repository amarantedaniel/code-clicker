defmodule CodeClicker.StoreTest do
  use CodeClicker.DataCase

  alias CodeClicker.Store

  describe "items" do
    alias CodeClicker.Store.Item

    @valid_attrs %{base_price: 42, clicks_per_second: 42, name: "some name", price_multiplier: 120.5}
    @update_attrs %{base_price: 43, clicks_per_second: 43, name: "some updated name", price_multiplier: 456.7}
    @invalid_attrs %{base_price: nil, clicks_per_second: nil, name: nil, price_multiplier: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Store.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Store.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Store.create_item(@valid_attrs)
      assert item.base_price == 42
      assert item.clicks_per_second == 42
      assert item.name == "some name"
      assert item.price_multiplier == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Store.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.base_price == 43
      assert item.clicks_per_second == 43
      assert item.name == "some updated name"
      assert item.price_multiplier == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_item(item, @invalid_attrs)
      assert item == Store.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Store.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Store.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Store.change_item(item)
    end
  end
end
