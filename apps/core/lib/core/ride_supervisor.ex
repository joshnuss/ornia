defmodule Ornia.Core.RideSupervisor do
  use DynamicSupervisor

  alias Ornia.Core.Ride

  @name __MODULE__

  def start_link(_),
    do: DynamicSupervisor.start_link(__MODULE__, :ok, name: @name)

  def init(:ok),
    do: DynamicSupervisor.init(strategy: :one_for_one)

  def start_child(passenger, driver, coordinates),
    do: DynamicSupervisor.start_child(@name, {Ride, [passenger, driver, coordinates]})
end
