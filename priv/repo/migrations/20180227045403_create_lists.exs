defmodule Api.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists) do

      timestamps()
    end

  end
end
