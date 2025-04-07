defmodule PragmaticWeb.FlightsLievPage do
  use PragmaticWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       flights: Pragmatic.Flights.list_flights(),
       search_key: nil
     )}
  end

  def handle_event("search", %{"search" => search}, socket) do
    {:noreply,
     assign(socket,
       flights: Pragmatic.Flights.find_airport(search),
       search_key: search
     )}
  end
end
