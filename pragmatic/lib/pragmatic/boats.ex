defmodule Pragmatic.Boats do
  @moduledoc """
  The Boats context.
  """

  import Ecto.Query, warn: false
  alias Pragmatic.Repo

  alias Pragmatic.Boats.Boat

  @doc """
  Returns the list of boats.

  ## Examples

      iex> list_boats()
      [%Boat{}, ...]

  """
  def list_boats do
    Repo.all(Boat)
  end

  def list_boats("All") do
    list_boats()
  end

  def list_boats(filter) do
    from(Boat)
    |> filter_type(String.downcase(filter.type))
    |> filter_price(filter.prices)
    |> Repo.all()
  end

  def filter_type(query, nil), do: query
  def filter_type(query, "all"), do: query
  def filter_type(query, type), do: query |> where(type: ^type)

  def filter_price(query, [""]), do: query
  def filter_price(query, []), do: query
  def filter_price(query, prices), do: query |> where([b], b.price in ^prices)|> IO.inspect()

  @doc """
  Gets a single boat.

  Raises `Ecto.NoResultsError` if the Boat does not exist.

  ## Examples

      iex> get_boat!(123)
      %Boat{}

      iex> get_boat!(456)
      ** (Ecto.NoResultsError)

  """
  def get_boat!(id), do: Repo.get!(Boat, id)

  @doc """
  Creates a boat.

  ## Examples

      iex> create_boat(%{field: value})
      {:ok, %Boat{}}

      iex> create_boat(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_boat(attrs \\ %{}) do
    %Boat{}
    |> Boat.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a boat.

  ## Examples

      iex> update_boat(boat, %{field: new_value})
      {:ok, %Boat{}}

      iex> update_boat(boat, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_boat(%Boat{} = boat, attrs) do
    boat
    |> Boat.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a boat.

  ## Examples

      iex> delete_boat(boat)
      {:ok, %Boat{}}

      iex> delete_boat(boat)
      {:error, %Ecto.Changeset{}}

  """
  def delete_boat(%Boat{} = boat) do
    Repo.delete(boat)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking boat changes.

  ## Examples

      iex> change_boat(boat)
      %Ecto.Changeset{data: %Boat{}}

  """
  def change_boat(%Boat{} = boat, attrs \\ %{}) do
    Boat.changeset(boat, attrs)
  end

  def list_boat_types(list) do
    Enum.map(list, fn boat -> String.capitalize(boat.type) end)
    |> Enum.uniq()
  end

  def list_boat_prices(list) do
    Enum.map(list, fn boat -> boat.price end)
    |> Enum.uniq()
  end
end
