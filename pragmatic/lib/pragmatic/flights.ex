defmodule Pragmatic.Flights do
  def find_airport(key) do
    Enum.filter(list_flights(), fn map ->
      Map.values(map)
      |> Enum.any?(fn value ->
        String.contains?(String.downcase(value), String.downcase(key))
      end)
    end)
  end

  def list_flights do
    [
      %{
        number: "450",
        origin: "DEN",
        destination: "ORD",
        departure_time: time_from_now(days: 1, hours: 1),
        arrival_time: time_from_now(days: 1, hours: 3)
      },
      %{
        number: "450",
        origin: "DEN",
        destination: "ORD",
        departure_time: time_from_now(days: 2, hours: 2),
        arrival_time: time_from_now(days: 2, hours: 4)
      },
      %{
        number: "450",
        origin: "DEN",
        destination: "ORD",
        departure_time: time_from_now(days: 3, hours: 1),
        arrival_time: time_from_now(days: 3, hours: 3)
      },
      %{
        number: "450",
        origin: "DEN",
        destination: "ORD",
        departure_time: time_from_now(days: 4, hours: 2),
        arrival_time: time_from_now(days: 4, hours: 4)
      },
      %{
        number: "860",
        origin: "DFW",
        destination: "ORD",
        departure_time: time_from_now(days: 1, hours: 1),
        arrival_time: time_from_now(days: 1, hours: 3)
      },
      %{
        number: "860",
        origin: "DFW",
        destination: "ORD",
        departure_time: time_from_now(days: 2, hours: 2),
        arrival_time: time_from_now(days: 2, hours: 4)
      },
      %{
        number: "860",
        origin: "DFW",
        destination: "ORD",
        departure_time: time_from_now(days: 3, hours: 1),
        arrival_time: time_from_now(days: 3, hours: 3)
      },
      %{
        number: "740",
        origin: "DAB",
        destination: "DEN",
        departure_time: time_from_now(days: 1, hours: 2),
        arrival_time: time_from_now(days: 1, hours: 5)
      },
      %{
        number: "740",
        origin: "DAB",
        destination: "DEN",
        departure_time: time_from_now(days: 2, hours: 1),
        arrival_time: time_from_now(days: 2, hours: 4)
      },
      %{
        number: "740",
        origin: "DAB",
        destination: "DEN",
        departure_time: time_from_now(days: 3, hours: 2),
        arrival_time: time_from_now(days: 3, hours: 5)
      }
    ]
  end

  defp time_from_now([days: _days, hours: _hours] = options) do
    Timex.now()
    |> Timex.shift(options)
    |> Timex.format!("%b %d at %H:%M", :strftime)
  end
end
