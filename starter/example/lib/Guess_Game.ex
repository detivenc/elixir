defmodule GuessGame do
  def main do
    IO.puts("Guess Game")
    correct = :rand.uniform(11) - 1
    guess = IO.gets("Guess a number between 0 and 10: ") |> String.trim() |> Integer.parse()
    IO.inspect(guess)

    case guess do
      {result, _} ->
        IO.puts("parse successfull #{result}")

        if result === correct do
          IO.puts("You win")
        else
          IO.puts("You fail")
        end

      :error ->
        IO.puts("Something went wrong")
    end
  end
end
