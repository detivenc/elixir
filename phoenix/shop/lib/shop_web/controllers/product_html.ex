defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  embed_templates "product_html/*"

  @doc """
  Aqui se indica como hacer los docs de una funcion
  el attr indica que valores necesita una funcion para dar desde si son requisitos como si no
  el require indica que valores necesita una funcion para dar desde si son requisitos como si no
  y el default indica que valor se asigna por defecto si no se proporciona uno
  """
  attr :name, :string, required: true
  attr :id, :string, default: nil
  # Función para contenido sin layout (útil para AJAX, modales, etc.)
  # Se puede agregar a los product_html/*.heex con un <.{your_function_name} />
  def index_no_layout(assigns) do
    ~H"""
    <p>
      Game: {@name}
      <.button :if={@id} navigate={~p"/products/#{@id}"}>Go to product details!</.button>
    </p>
    """
  end
end
