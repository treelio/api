defmodule Api.Repo.Migrations.CreateListItems do
  use Ecto.Migration

  def change do
    create table(:list_items) do

      timestamps()
    end

  end
end
