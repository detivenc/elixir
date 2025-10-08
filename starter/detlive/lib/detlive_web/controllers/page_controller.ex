defmodule DetliveWeb.PageController do
  use DetliveWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
