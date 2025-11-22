defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  embed_templates "product_html/*"

  attr :name, :string, required: true
  # Función para contenido sin layout (útil para AJAX, modales, etc.)
  # Se puede agregar a los product_html/*.heex con un <.{your_function_name} />
  def index_no_layout(assigns) do
    ~H"""
    <p>Game: <%= @name %></p>
    """
  end
end
