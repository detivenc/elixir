defmodule DatesTimes do
  def main do
    IO.puts("Dates and times")
    time = Time.new!(16, 30, 0, 0)
    date = Date.new!(2026, 1, 1)
    date_time = DateTime.new!(date, time)
    # No puedes poner IO.puts() por temas de como funciona el struct y se usa IO.inspect()
    IO.inspect("#{time} #{date} = #{date_time}")

    time_till = DateTime.diff(date_time, DateTime.utc_now())
    IO.puts(time_till)

    days = div(time_till, 86_400)
    IO.puts(days)
    hours = div(rem(time_till, 86_400), 60 * 60)
    IO.puts(hours)
    mins = div(rem(time_till, 60 * 60), 60 * 60)
    IO.puts(mins)
    seconds = rem(time_till, 60)
    IO.puts(seconds)
  end
end
