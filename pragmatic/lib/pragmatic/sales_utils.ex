defmodule Pragmatic.SalesUtils do
  def new_orders() do
    Enum.random(3..10)
  end

  def new_amount do
    Enum.random(100..1000)
  end

  def satisfaction do
    Enum.random(50..99)
  end
end
