defmodule PragmaticWeb.BingoLivePage do
  use PragmaticWeb, :live_view

  alias Pragmatic.BingoUtils

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(3000, self(), :refresh)
    end

    {:ok, socket |> assign_number}
  end

  def render(assigns) do
    ~H"""
    <div>
    <h1 class="text-center mt-12">{@number}</h1>
    </div>
    """
  end

  def handle_info(:refresh, socket) do
    {:noreply, socket |> assign_number()}
  end

  defp assign_number(socket) do
    assign(socket,
      number: BingoUtils.random_number()
    )
  end
end
