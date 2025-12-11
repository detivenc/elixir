defmodule StockExplorer.Repo do
  use Ecto.Repo,
    otp_app: :stock_explorer,
    adapter: Ecto.Adapters.Postgres
end
