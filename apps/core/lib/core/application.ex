defmodule Ornia.Core.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Ornia.Core.Grid,
      Ornia.Core.UserSupervisor,
      Ornia.Core.DispatcherSupervisor,
      Ornia.Core.PickupSupervisor,
      Ornia.Core.RideSupervisor,
    ]

    opts = [strategy: :one_for_one, name: Ornia.Core.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
