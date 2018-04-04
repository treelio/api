defmodule Api.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons, primary_key: false) do
      add(:first_name, :string)
      add(:last_name, :string)
      add(:nickname, :string)
      add(:age, :decimal)
      add(:address_id, references(:adresses, type: :uuid))
      timestamps()
    end
  end
end
