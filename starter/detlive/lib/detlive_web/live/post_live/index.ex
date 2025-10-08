defmodule DetliveWeb.PostLive.Index do
  use DetliveWeb, :live_view

  alias Detlive.Timeline

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Timeline
        <:actions>
          <.button variant="primary" navigate={~p"/new"}>
            <.icon name="hero-plus" /> New Post
          </.button>
        </:actions>
      </.header>

      <.table
        id="posts"
        rows={@streams.posts}
        row_click={fn {_id, post} -> JS.navigate(~p"/#{post}") end}
      >
        <:col :let={{_id, post}} label="Username">{post.username}</:col>
        <:col :let={{_id, post}} label="Body">{post.body}</:col>
        <:col :let={{_id, post}} label="Likes count">{post.likes_count}</:col>
        <:col :let={{_id, post}} label="Reposts count">{post.reposts_count}</:col>
        <:action :let={{_id, post}}>
          <div class="sr-only">
            <.link navigate={~p"/#{post}"}>Show</.link>
          </div>
          <.link navigate={~p"/#{post}/edit"}>Edit</.link>
        </:action>
        <:action :let={{id, post}}>
          <.link
            phx-click={JS.push("delete", value: %{id: post.id}) |> hide("##{id}")}
            data-confirm="Are you sure?"
          >
            Delete
          </.link>
        </:action>
      </.table>
    </Layouts.app>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Listing Posts")
     |> stream(:posts, list_posts())}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    post = Timeline.get_post!(id)
    {:ok, _} = Timeline.delete_post(post)

    {:noreply, stream_delete(socket, :posts, post)}
  end

  defp list_posts() do
    Timeline.list_posts()
  end
end
