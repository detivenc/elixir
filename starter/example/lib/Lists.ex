defmodule Lists do
  require Integer

  def main do
    IO.puts("Lists")
    grades = [25, 50, 75, 100]
    new = for n <- grades, do: n + 5
    IO.inspect(new)
    # Append at with ++
    new = new ++ [125]
    new = new ++ [111, 233, 123_123]
    # Append at first with (value) | (and the list)
    final = [5 | new]
    IO.inspect(final)
    even = for n <- final, Integer.is_even(n), do: n
    IO.inspect(even)
  end
end
