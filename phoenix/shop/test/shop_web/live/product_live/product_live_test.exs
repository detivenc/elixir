defmodule ShopWeb.ProductLiveTest do
  use ShopWeb.ConnCase, async: true
  import Phoenix.LiveViewTest

  import Shop.ProductsFixtures

  test "clicking like increments the product likes counter", %{conn: conn} do
    product = product_fixture()

    # mount LiveView
    assert {:ok, view, _html} = live(conn, ~p"/products-live")

    # Assert the specific paragraph contains the expected initial text (note the colon)
    assert has_element?(view, "p", "#{product.name} - Likes: 0")

    # Find the like control and click it. Template uses phx-click="like" phx-value-id="...".
    like_btn = element(view, "span[phx-click=\"like\"][phx-value-id=\"#{product.id}\"]")
    render_click(like_btn)

    # After click, assert the counter updated
    assert has_element?(view, "p", "#{product.name} - Likes: 1")

    # Find the like control and click it. Template uses phx-click="dislike" phx-value-id="...".
    dislike_btn = element(view, "span[phx-click=\"dislike\"][phx-value-id=\"#{product.id}\"]")
    render_click(dislike_btn)

    # After click, assert the counter updated
    assert has_element?(view, "p", "#{product.name} - Likes: 0")
  end
end
