defmodule SimpleWebserver.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      {SimpleWebserver.PlugAdapter, plug: SnoopRequest, port: 8080}
    ]

    opts = [strategy: :one_for_one, name: SimpleWebserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
