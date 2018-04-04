defmodule Api.Lists.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.Person


  schema "persons" do

    timestamps()
  end

  @doc false
  def changeset(%Person{} = person, attrs) do
    person
    |> cast(attrs, [])
    |> validate_required([])
  end
end
