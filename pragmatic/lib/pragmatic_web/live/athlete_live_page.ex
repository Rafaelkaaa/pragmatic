defmodule PragmaticWeb.AthleteLivePage do
  use PragmaticWeb, :live_view
  alias Pragmatic.Athletes

    def mount(_params, _session, socket) do
        socket =
        assign(socket,
            athletes: Athletes.list_athletes(),
            filter: %{status: "All", sport: "All"},
            statuses:  Athletes.list_athletes_statuses(),
            sports: Athletes.list_athletes_sports()
        )

        {:ok, socket, temporary_assigns: [athletes: []]}
    end

  def handle_event("filter", params, socket) do
    {:noreply, assign(socket, athletes: Athletes.list_athletes())}
  end
end
