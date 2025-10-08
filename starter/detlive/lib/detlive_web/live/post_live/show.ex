defmodule DetliveWeb.PostLive.Show do
  use DetliveWeb, :live_view

  alias Detlive.Timeline

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.app flash={@flash}>
      <.header>
        Post {@post.id}
        <:subtitle>This is a post record from your database.</:subtitle>
        <:actions>
          <.button navigate={~p"/posts"}>
            <.icon name="hero-arrow-left" />
          </.button>
          <.button variant="primary" navigate={~p"/posts/#{@post}/edit?return_to=show"}>
            <.icon name="hero-pencil-square" /> Edit post
          </.button>
        </:actions>
      </.header>

      <.list>
        <:item title="Username">{@post.username}</:item>
        <:item title="Body">{@post.body}</:item>
        <:item title="Likes count">{@post.likes_count}</:item>
        <:item title="Reposts count">{@post.reposts_count}</:item>
      </.list>
    </Layouts.app>
    """
  end

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok,
     socket
     |> assign(:page_title, "Show Post")
     |> assign(:post, Timeline.get_post!(id))}
  end
end
