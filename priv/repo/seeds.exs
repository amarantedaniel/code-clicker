# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CodeClicker.Repo.insert!(%CodeClicker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CodeClicker.{Store.Item, Repo}

# We are deleting the data here !!!!!!!>!!<!>!<><>!<
Repo.all(Item)
|> Enum.each(fn x -> Repo.delete(x) end)

code_monkey_seed = %{
  name: "Code Monkey",
  base_price: 10,
  price_multiplier: 1.05,
  clicks_per_second: 10
}

software_developer_seed = %{
  name: "Software Developer",
  base_price: 50,
  price_multiplier: 1.05,
  clicks_per_second: 50
}

%Item{}
|> Item.changeset(code_monkey_seed)
|> Repo.insert!()

%Item{}
|> Item.changeset(software_developer_seed)
|> Repo.insert!()
