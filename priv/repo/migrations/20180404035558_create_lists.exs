defmodule Api.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:name, :string)
      add(:image_link, :string)
      add(:category, :string)
      add(:description, :string)
      add(:address_id, references(:addresses, type: :uuid))
      timestamps()
    end
  end
end
