defmodule Shop.Repo.Migrations.CreatePromotions do
  use Ecto.Migration

  def change do
    create table(:promotions) do
      add :name, :string
      add :code, :string
      add :expires_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:promotions, [:code])
  end
end
