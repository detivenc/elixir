# Phoenix 1.8 - Manejo de Layouts

## 🔄 Diferencia Principal: Phoenix 1.7 vs 1.8

### Phoenix 1.7 (Layout Automático)
```elixir
# En Phoenix 1.7, el layout se aplicaba automáticamente
def index(assigns) do
  ~H"""
  <h1>Mi Página</h1>
  <p>El layout se agregaba automáticamente</p>
  """
end
```

### Phoenix 1.8 (Layout Manual)
```elixir
# En Phoenix 1.8, TÚ decides cuándo usar layout
def index(assigns) do
  ~H"""
  <Layouts.app flash={@flash} current_scope={assigns[:current_scope]}>
    <h1>Mi Página</h1>
    <p>Yo controlo cuándo usar el layout</p>
  </Layouts.app>
  """
end
```

## 📁 Estructura de Archivos

```
lib/shop_web/controllers/
├── product_controller.ex          # Controller con acciones
├── product_html.ex               # Módulo HTML con funciones
└── product_html/                 # Directorio de templates
    └── index.html.heex           # Template de la vista
```

## 🎯 Opciones de Layout

### 1. Con Layout Completo (Recomendado)

**Archivo:** `product_html/index.html.heex`
```heex
<Layouts.app flash={@flash} current_scope={assigns[:current_scope]}>
  <div class="container mx-auto px-4 py-8">
    <h1>Tu Contenido Aquí</h1>
    <!-- Incluye header, navbar, footer automáticamente -->
  </div>
</Layouts.app>
```

**Cuándo usarlo:**
- ✅ Páginas completas del sitio
- ✅ Vistas principales de la aplicación
- ✅ Cualquier página que necesite navegación

### 2. Sin Layout (Para Componentes)

**Archivo:** `product_html.ex`
```elixir
def modal_content(assigns) do
  ~H"""
  <div class="modal-content">
    <h2>Solo el Contenido</h2>
    <!-- Sin header, navbar, o footer -->
  </div>
  """
end
```

**Cuándo usarlo:**
- ✅ Llamadas AJAX
- ✅ Modales y popups
- ✅ Componentes embebidos
- ✅ API endpoints que devuelven HTML

### 3. Layout Personalizado

```elixir
# Puedes crear tu propio componente de layout
def custom_layout(assigns) do
  ~H"""
  <div class="custom-wrapper">
    <nav>Mi navbar personalizado</nav>
    <main>{render_slot(@inner_block)}</main>
  </div>
  """
end
```

## 🔧 Controller Setup

```elixir
defmodule ShopWeb.ProductController do
  use ShopWeb, :controller

  # Usa template con layout
  def index(conn, _params) do
    render(conn, :index)  # Busca product_html/index.html.heex
  end

  # Usa función sin layout
  def modal(conn, _params) do
    render(conn, :modal_content, layout: false)
  end
end
```

## 📝 HTML Module Setup

```elixir
defmodule ShopWeb.ProductHTML do
  use ShopWeb, :html

  # Incluye todos los templates del directorio
  embed_templates "product_html/*"

  # Funciones para contenido sin layout
  def modal_content(assigns) do
    ~H"""
    <!-- Tu contenido aquí -->
    """
  end
end
```

## 🎨 Parámetros Importantes del Layout

### Parámetros Obligatorios
```heex
<Layouts.app 
  flash={@flash}                    <!-- Mensajes flash (obligatorio) -->
  current_scope={assigns[:current_scope]}  <!-- Scope actual (obligatorio) -->
>
  <!-- Tu contenido -->
</Layouts.app>
```

### ¿Por qué son obligatorios?
- **`flash={@flash}`**: Para mostrar mensajes de éxito, error, etc.
- **`current_scope`**: Para autenticación y autorización

## 🚀 Ejemplos Prácticos

### Página Principal
```heex
<!-- product_html/index.html.heex -->
<Layouts.app flash={@flash} current_scope={assigns[:current_scope]}>
  <div class="container mx-auto px-4 py-8">
    <h1 class="text-4xl font-bold">Productos</h1>
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <!-- Tu contenido -->
    </div>
  </div>
</Layouts.app>
```

### Modal AJAX
```elixir
# En product_html.ex
def product_modal(assigns) do
  ~H"""
  <div class="modal">
    <div class="modal-content">
      <h3>Agregar Producto</h3>
      <.form for={@form}>
        <.input field={@form[:name]} label="Nombre" />
        <.input field={@form[:price]} label="Precio" />
      </.form>
    </div>
  </div>
  """
end
```

### Componente Embebido
```elixir
def product_card(assigns) do
  ~H"""
  <div class="card">
    <h4>{@product.name}</h4>
    <p>Precio: ${@product.price}</p>
  </div>
  """
end
```

## ⚡ Tips y Mejores Prácticas

### 1. Usa Templates Externos (.heex)
```
✅ BIEN: product_html/index.html.heex
❌ MAL: Todo en funciones dentro del módulo
```

### 2. Controla el Layout Según el Contexto
```elixir
# Página completa = Con layout
def index(conn, _params), do: render(conn, :index)

# AJAX/Modal = Sin layout  
def modal(conn, _params), do: render(conn, :modal, layout: false)
```

### 3. Siempre Pasa Flash y Current Scope
```heex
<!-- SIEMPRE incluye estos parámetros -->
<Layouts.app flash={@flash} current_scope={assigns[:current_scope]}>
```

### 4. Naming Conventions
```
Controller: ProductController
HTML Module: ProductHTML  (con HTML en mayúsculas)
Templates: product_html/action.html.heex
```

## 🔍 Debugging

### Error Común: "no template defined"
```
** (ArgumentError) no "index" html template defined for ShopWeb.ProductHTML
```

**Solución:**
1. ✅ Verifica que existe `product_html/index.html.heex`
2. ✅ Verifica que el módulo se llama `ProductHTML` (no `ProductHtml`)
3. ✅ Verifica que tienes `embed_templates "product_html/*"`

### Error Común: Layout no se aplica
```
<!-- MALO: Sin layout wrapper -->
<h1>Mi página</h1>

<!-- BUENO: Con layout wrapper -->
<Layouts.app flash={@flash} current_scope={assigns[:current_scope]}>
  <h1>Mi página</h1>
</Layouts.app>
```

## 🎯 Resumen

| Situación | Solución | Archivo |
|-----------|----------|---------|
| Página completa | `<Layouts.app>` | `.heex` template |
| Modal/AJAX | Sin `<Layouts.app>` | Función en módulo HTML |
| Componente | Sin `<Layouts.app>` | Función en módulo HTML |
| Layout personalizado | Tu propio componente | Tu función de layout |

**Regla de Oro:** En Phoenix 1.8, TÚ tienes control total sobre cuándo y cómo usar layouts. ¡Úsalo a tu favor!