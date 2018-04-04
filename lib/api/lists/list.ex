defmodule Api.Lists.List do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.List


  schema "lists" do

    timestamps()
  end

  @doc false
  def changeset(%List{} = list, attrs) do
    list
    |> cast(attrs, [])
    |> validate_required([])
  end
end
