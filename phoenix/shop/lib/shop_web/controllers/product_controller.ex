defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  alias Shop.{Repo, Product}

  def index(conn, _params) do
    products = Repo.all(Product)

    conn
    |> assign(:products, products)
    |> render(:index)
  end

  def index_no_layout(conn, _params) do
    render(conn, :index_no_layout, layout: false)
  end

  def show(conn, %{"slug" => slug}) do
    product = Repo.get_by(Product, slug: slug)

    conn
    |> assign(:product, product)
    |> render(:show)
  end
end
