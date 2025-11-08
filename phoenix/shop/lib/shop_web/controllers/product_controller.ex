defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def index_no_layout(conn, _params) do
    render(conn, :index_no_layout, layout: false)
  end

  def show(conn, %{"id" => id}) do
    render(conn, :show, id: id)
  end
end
