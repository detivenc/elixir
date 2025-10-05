defmodule FuncProgramming do
  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    average = sum / Enum.count(numbers)
    {sum, average}
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(" ") |> IO.puts()
  end

  def get_numbers_from_user do
    IO.puts("Enter numbers separated by spaces: ")
    user_input = IO.gets("") |> String.trim()
    String.split(user_input, " ") |> Enum.map(&String.to_integer/1)
  end

  def main do
    IO.puts("Functional programming")
    numbers = [1, 2, 3, 4, 5]
    Enum.each(numbers, fn num -> IO.puts(num) end)

    numbers = get_numbers_from_user()

    {sum, average} = sum_and_average(numbers)
    IO.puts("Sum: #{sum}, average: #{average}")
  end
end
