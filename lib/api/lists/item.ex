defmodule Api.Lists.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.Item

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "items" do
    field(:name, :string)
    field(:description, :string)
    field(:price, :decimal)
    field(:image_link, :string)
    field(:amazon_id, :string)
    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:name, :description, :price, :image_link, :amazon_id])
    |> validate_required([:name, :price])
    |> validate_number(:price, greater_than: 0)
    |> validate_length(:name, min: 3)
  end
end
