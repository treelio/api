defmodule Api.Lists.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.List

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "lists" do
    field(:name, :string)
    field(:description, :string)

    many_to_many(:items, Api.Lists.Item, join_through: "list_items")

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(%List{} = list, attrs) do
    list
    |> cast(attrs, [:name, :description])
    |> validate_required([:name])
    |> validate_length(:name, min: 3)
  end
end
