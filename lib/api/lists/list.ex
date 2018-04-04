defmodule Api.Lists.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.List

  @primary_key {:id, :binary_id, autogenerate: false}
  @foreign_key_type :binary_id

  schema "lists" do
    field(:name, :string)
    field(:description, :string)

    has_many(:list_items, Akka.List.ListItem, on_delete: :delete_all)
    has_many(:items, Api.List.Item, join_trhough: "list_items")

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%List{} = list, attrs) do
    list
    |> cast(attrs, [])
    |> validate_required([])
  end
end
