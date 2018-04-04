defmodule Api.Lists.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.Item

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "items" do
    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [])
    |> validate_required([])
  end
end
