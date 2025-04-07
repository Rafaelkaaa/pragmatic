defmodule PragmaticWeb.IlandLivePage do
  use PragmaticWeb, :live_view

  alias Pragmatic.SandUtils

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket, wight: 0.0, price: nil)
     |> assign_params(0, 0, 0)}
  end

  def handle_event("count_sand", %{"length" => l, "depth" => d, "width" => w}, socket) do
    wight = SandUtils.count_sand(l, w, d)
    price = SandUtils.count_price(wight)

    {:noreply,
     assign(socket, wight: wight, price: price)
     |> assign_params(l, d, w)}
  end

  def assign_params(socket, length, depth, width) do
    assign(socket,
      length: length,
      width: width,
      depth: depth
    )
  end
end
