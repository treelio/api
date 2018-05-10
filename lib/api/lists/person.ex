defmodule Api.Lists.Person do
  use Ecto.Schema
  import Ecto.Changeset
  alias Api.Lists.Person

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "persons" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:nickname, :string)
    field(:gender, :string)
    field(:age, :integer)
    field(:image_link, :string)
    timestamps()
  end

  @doc false
  def changeset(%Person{} = person, attrs) do
    person
    |> cast(attrs, [:first_name, :last_name, :nickname, :gender, :age])
    |> validate_required([:first_name])
    |> validate_length(:first_name, min: 3)
  end
end
