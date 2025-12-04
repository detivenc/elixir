defmodule Shop.Promotions.Promotion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "promotions" do
    field :name, :string
    field :code, :string
    field :expires_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(promotion, attrs) do
    promotion
    |> cast(attrs, [:name, :code, :expires_at])
    |> validate_required([:name, :code, :expires_at])
    |> unique_constraint(:code)
  end
end
