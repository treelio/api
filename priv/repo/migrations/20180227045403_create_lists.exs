defmodule Api.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:name, :string)
      add(:description, :string)
      add(:address_id, references(:adresses, type: :uuid))
      timestamps()
    end
  end
end
