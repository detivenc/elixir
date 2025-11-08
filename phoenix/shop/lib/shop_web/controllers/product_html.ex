defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  embed_templates "product_html/*"

  # Función para contenido sin layout (útil para AJAX, modales, etc.)
  def index_no_layout(assigns) do
    ~H"""
    <div class="container mx-auto px-4 py-8">
      <div class="mb-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-4">Productos (Sin Layout)</h1>
        <p class="text-gray-600 text-lg">Este contenido no tiene el layout principal</p>
      </div>

      <div class="bg-white rounded-lg shadow-sm border border-gray-200">
        <div class="p-8">
          <div class="text-center py-12">
            <div class="mx-auto w-24 h-24 mb-6">
              <.icon name="hero-shopping-bag" class="w-24 h-24 text-gray-300" />
            </div>

            <h3 class="text-xl font-semibold text-gray-900 mb-2">
              Contenido Sin Layout
            </h3>

            <p class="text-gray-500 mb-8 max-w-md mx-auto">
              Este es un ejemplo de cómo renderizar contenido sin el layout principal.
              Útil para llamadas AJAX, modales, o componentes embebidos.
            </p>

            <button
              type="button"
              class="inline-flex items-center justify-center px-6 py-3 border border-transparent text-base font-medium rounded-lg text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors"
            >
              <.icon name="hero-check" class="mr-2 h-5 w-5" /> Sin Layout
            </button>
          </div>
        </div>
      </div>

      <div class="mt-8 bg-green-50 border-l-4 border-green-400 p-4 rounded-r-lg">
        <div class="flex">
          <div class="flex-shrink-0">
            <.icon name="hero-information-circle" class="h-5 w-5 text-green-400" />
          </div>
          <div class="ml-3">
            <h4 class="text-sm font-medium text-green-800">
              Contenido Sin Layout
            </h4>
            <p class="mt-1 text-sm text-green-700">
              Este template NO usa <code>&lt;Layouts.app&gt;</code>.
              Solo devuelve el HTML del contenido, sin header, navbar, o footer.
            </p>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
