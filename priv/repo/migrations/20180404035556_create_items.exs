defmodule Api.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:name, :string)
      add(:description, :string)
      add(:price, :decimal)
      add(:image_link, :string)
      add(:amazon_id, :string)

      timestamps()
    end
  end
end
