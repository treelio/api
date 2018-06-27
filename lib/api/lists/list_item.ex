defmodule Api.Lists.ListItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.ListItem

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "list_items" do
    field(:quantity, :integer)
    has_one(:item, {"items", Item})
    has_one(:list, {"lists", List})
    timestamps()
  end

  @doc false
  def changeset(%ListItem{} = list_item, attrs) do
    list_item
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
    |> validate_number(:quantity, greater_than: 0)
  end
end
