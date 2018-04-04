defmodule Api.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do

      timestamps()
    end

  end
end
