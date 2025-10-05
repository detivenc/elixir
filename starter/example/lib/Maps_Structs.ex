# Structs
defmodule Membership do
  defstruct [:type, :price]
end

# Structs
defmodule User do
  defstruct [:name, :membership]
end

defmodule MapsStructs do
  def main do
    IO.puts("Maps")

    gold_membership = %Membership{type: :gold, price: 25}
    silver_membership = %Membership{type: :silver, price: 25}
    bronze_membership = %Membership{type: :bronze, price: 25}
    _none_membership = %Membership{type: :none, price: 25}

    users = [
      %User{name: "Nico", membership: silver_membership},
      %User{name: "Luc", membership: bronze_membership},
      %User{name: "ER", membership: gold_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} ->
      IO.puts("#{name} has a #{membership.type} membership paying #{membership.price}.")
    end)
  end
end
