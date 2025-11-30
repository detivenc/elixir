defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html
  alias Shop.Products.Product

  embed_templates "product_html/*"

  @doc """
  Aqui se indica como hacer los docs de una funcion
  el attr indica que valores necesita una funcion para dar desde si son requisitos como si no
  el require indica que valores necesita una funcion para dar desde si son requisitos como si no
  y el default indica que valor se asigna por defecto si no se proporciona uno
  """
  attr :product, Product, required: true
  # Función para contenido sin layout (útil para AJAX, modales, etc.)
  # Se puede agregar a los product_html/*.heex con un <.{your_function_name} />
  def index_no_layout(assigns) do
    ~H"""
    <.link href={~p"/products/#{@product.slug}"} class="block">
      Game: {@product.name}
    </.link>
    """
  end
end
