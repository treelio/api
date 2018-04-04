defmodule Api.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do

      timestamps()
    end

  end
end
