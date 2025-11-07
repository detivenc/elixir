defmodule ShopWeb.PageController do
  use ShopWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
