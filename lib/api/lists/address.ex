defmodule Api.Lists.Address do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.Address

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "addresses" do
    timestamps()
  end

  @doc false
  def changeset(%Address{} = address, attrs) do
    address
    |> cast(attrs, [])
    |> validate_required([])
  end
end
