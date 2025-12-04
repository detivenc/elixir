defmodule Shop.Consoles.Console do
  use Ecto.Schema
  import Ecto.Changeset

  schema "consoles" do
    field :name, :string
    field :price, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(console, attrs) do
    console
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
