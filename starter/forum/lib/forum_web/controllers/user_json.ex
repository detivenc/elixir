defmodule ForumWeb.UserJSON do
  alias Forum.Posts.Post
  alias Forum.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      posts: for(post <- user.posts, do: post_data(post))
    }
  end

  defp post_data(%Post{} = post) do
    %{
      id: post.id,
      title: post.title,
      body: post.body
    }
  end
end
