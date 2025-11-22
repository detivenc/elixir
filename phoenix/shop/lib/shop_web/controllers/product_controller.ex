defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  @products [
    %{id: 1, name: "God of War"},
    %{id: 2, name: "Skyrim"},
    %{id: 3, name: "Diablo 4"}
  ]

  def index(conn, _params) do
    conn
    |> assign(:products, @products)
    |> render(:index)
  end

  def index_no_layout(conn, _params) do
    render(conn, :index_no_layout, layout: false)
  end

  def show(conn, %{"id" => id}) do
    product = Enum.find(@products, fn p -> p.id == String.to_integer(id) end)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
