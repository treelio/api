defmodule Api.Lists.ListItem do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.ListItem


  schema "list_items" do

    timestamps()
  end

  @doc false
  def changeset(%ListItem{} = list_item, attrs) do
    list_item
    |> cast(attrs, [])
    |> validate_required([])
  end
end
