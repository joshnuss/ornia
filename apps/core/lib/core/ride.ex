defmodule Ornia.Core.Ride do
  use GenServer, restart: :transient

  alias Ornia.Core.Passenger

  def start_link([passenger, driver, coordinates]) do
    state = %{
      passenger: passenger,
      driver: driver,
      points: [coordinates],
    }

    GenServer.start_link(__MODULE__, state, [])
  end

  def handle_call({:move, coordinates}, _from, state=%{points: points}),
    do: {:reply, :ok, %{state | points: [{DateTime.utc_now, coordinates}|points]}}

  def handle_call(:complete, _from, state) do
    Passenger.arrive(state.passenger)
    {:stop, :normal, :ok, state}
  end

  def move(pid, coordinates),
    do: GenServer.call(pid, {:move, coordinates})

  def complete(pid),
    do: GenServer.call(pid, :complete)
end
