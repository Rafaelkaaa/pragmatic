defmodule PragmaticWeb.SalesLivePage do
  use PragmaticWeb, :live_view

  alias Pragmatic.SalesUtils

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(1000, self(), :refresh)
    end

    {:ok, socket |> assign_sales_data}
  end

  def handle_info(:refresh, socket) do
    {:noreply, socket |> assign_sales_data}
  end

  def handle_event("refresh", _params, socket) do
    {:noreply, socket |> assign_sales_data}
  end

  defp assign_sales_data(socket) do
    assign(socket,
      orders: SalesUtils.new_orders(),
      amount: SalesUtils.new_amount(),
      satisfaction: SalesUtils.satisfaction()
    )
  end
end
