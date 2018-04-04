defmodule Api.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add(:id, :uuid, primary_key: true)
      add(:type, :string)
      add(:street_name, :string)
      add(:city, :string)
      add(:state, :string)
      add(:zip_code, :integer)
    end
  end
end
