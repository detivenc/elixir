defmodule Detlive.Repo do
  use Ecto.Repo,
    otp_app: :detlive,
    adapter: Ecto.Adapters.SQLite3
end
