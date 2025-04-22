defmodule PragmaticWeb.BoatsLivePage do
  use PragmaticWeb, :live_view

  alias Pragmatic.Boats

  def mount(_params, _session, socket) do
    boats = Boats.list_boats()

    {:ok,
     socket
     |> assign(
       boats: boats,
       boat_types: Boats.list_boat_types(boats)|>IO.inspect(),
       boat_prices: Boats.list_boat_prices(boats),
       filter: %{type: nil, prices: []}
     )}
  end

  def handle_event("filter", %{"boat_type" => boat_type, "boat_prices" => prices}, socket) do
    updated_filter = %{
      type: boat_type |>IO.inspect(),
      prices: prices
    }

    {:noreply,
     socket
     |> assign(filter: updated_filter)
     |> assign(boats: Boats.list_boats(updated_filter))}
  end

  def handle_event("filter", %{"boat_type" => boat_type}, socket) do
    filter =
      socket.assigns.filter
      |> Map.put(:type, boat_type)

    {:noreply,
     socket
     |> assign(filter: filter)
     |> assign(boats: Boats.list_boats(filter))}
  end
end
