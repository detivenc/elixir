defmodule ShopWeb.PromotionHTML do
  use ShopWeb, :html

  embed_templates "promotion_html/*"

  @doc """
  Renders a promotion form.

  The form is defined in the template at
  promotion_html/promotion_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def promotion_form(assigns)
end
