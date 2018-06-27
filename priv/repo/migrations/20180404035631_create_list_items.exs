defmodule Api.Repo.Migrations.CreateListItems do
  use Ecto.Migration

  def change do
    create table(:list_items, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:list_id, references(:lists, type: :uuid))
      add(:person_id, references(:persons, type: :uuid))
      add(:item_id, references(:items, type: :uuid))
      add(:quantity, :integer)
      timestamps()
    end
  end
end
