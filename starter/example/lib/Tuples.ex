defmodule Tuples do
  def main do
    IO.puts("Tuples")
    memberships = {:bronze, :silver}
    memberships = Tuple.insert_at(memberships, tuple_size(memberships), :gold)
    IO.inspect(memberships)

    prices = {5, 10, 15}
    avg = Tuple.sum(prices) / tuple_size(prices)
    IO.puts(avg)

    IO.puts(
      "Average price from #{elem(memberships, 0)} #{elem(memberships, 1)} #{elem(memberships, 2)} is #{avg}"
    )

    user1 = {"Nico", :gold}
    user2 = {"Nico", :bronze}
    user3 = {"Nico", :silver}

    {name, membership} = user1
    IO.puts("#{name} has a #{membership} membership.")
    {name, membership} = user2
    IO.puts("#{name} has a #{membership} membership.")
    {name, membership} = user3
    IO.puts("#{name} has a #{membership} membership.")

    # Loop on Tuples
    IO.puts("Loop in tuples")

    users = [
      {"Nico", :silver},
      {"Luc", :bronze},
      {"ER", :gold}
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} has a #{membership} membership.")
    end)
  end
end
