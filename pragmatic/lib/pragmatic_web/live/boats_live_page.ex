defmodule PragmaticWeb.BoatsLivePage do
  use PragmaticWeb, :live_view

  alias Pragmatic.Boats

  def mount(_params, _session, socket) do
    boats = Boats.list_boats()
    {:ok, socket |> assign(boats: boats, boat_types: Boats.list_boat_types(boats))}
  end

  def handle_event("filter", %{"boat_type" => boat_type}, socket) do
    IO.inspect(boat_type)
    {:noreply, assign(socket, boats: Boats.list_boats(boat_type))}
  end

end
