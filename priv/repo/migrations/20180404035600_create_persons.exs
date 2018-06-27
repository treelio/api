defmodule Api.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons, primary_key: false) do
      add(:id, :uuid, primary_key: true)
      add(:first_name, :string)
      add(:last_name, :string)
      add(:nickname, :string)
      add(:gender, :string)
      add(:age, :decimal)
      add(:image_link, :string)
      add(:address_id, references(:addresses, type: :uuid))
      timestamps()
    end
  end
end
