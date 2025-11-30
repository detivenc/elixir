defmodule Shop.Products do
  alias Shop.Repo
  alias Shop.Products.Product

  def list_products, do: Repo.all(Product)

  def find_product_by_slug(slug) when is_binary(slug), do: Repo.get_by(Product, slug: slug)

  def find_product_by_id(id), do: Repo.get(Product, id)

  def delete_product(product = %Product{}), do: Repo.delete(product)

  def create_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end
end
