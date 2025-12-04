defmodule Shop.Consoles do
  @moduledoc """
  The Consoles context.
  """

  import Ecto.Query, warn: false
  alias Shop.Repo

  alias Shop.Consoles.Console

  @doc """
  Returns the list of consoles.

  ## Examples

      iex> list_consoles()
      [%Console{}, ...]

  """
  def list_consoles do
    Repo.all(Console)
  end

  @doc """
  Gets a single console.

  Raises `Ecto.NoResultsError` if the Console does not exist.

  ## Examples

      iex> get_console!(123)
      %Console{}

      iex> get_console!(456)
      ** (Ecto.NoResultsError)

  """
  def get_console!(id), do: Repo.get!(Console, id)

  @doc """
  Creates a console.

  ## Examples

      iex> create_console(%{field: value})
      {:ok, %Console{}}

      iex> create_console(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_console(attrs) do
    %Console{}
    |> Console.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a console.

  ## Examples

      iex> update_console(console, %{field: new_value})
      {:ok, %Console{}}

      iex> update_console(console, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_console(%Console{} = console, attrs) do
    console
    |> Console.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a console.

  ## Examples

      iex> delete_console(console)
      {:ok, %Console{}}

      iex> delete_console(console)
      {:error, %Ecto.Changeset{}}

  """
  def delete_console(%Console{} = console) do
    Repo.delete(console)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking console changes.

  ## Examples

      iex> change_console(console)
      %Ecto.Changeset{data: %Console{}}

  """
  def change_console(%Console{} = console, attrs \\ %{}) do
    Console.changeset(console, attrs)
  end
end
