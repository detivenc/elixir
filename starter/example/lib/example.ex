defmodule Example do
  use Application

  def start(_type, _args) do
    Example.main()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "Nico"
    status = Enum.random([:gold, :silver, :"not a member"])
    a = 10
    b = 5

    case status do
      :gold -> IO.puts("Welcome, #{name}")
      :"not a member" -> IO.puts("Get w")
      _ -> IO.puts("Get out")
    end

    IO.puts(a / b)
    a = a + 5
    IO.puts(a + b)

    IO.puts(Float.ceil(0.1, 1))
    IO.puts(Integer.gcd(78, 1000))
    IO.puts("This\nis\ta\n")
    IO.puts("After")
    IO.puts("\u0113")
  end
end
