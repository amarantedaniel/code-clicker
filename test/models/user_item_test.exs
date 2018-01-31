defmodule CodeClicker.UserItemTest do
  use CodeClicker.ModelCase

  alias CodeClicker.UserItem

  @valid_attrs %{count: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserItem.changeset(%UserItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserItem.changeset(%UserItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
