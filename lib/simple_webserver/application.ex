defmodule SimpleWebserver.Application do
@moduledoc "OTP Application specification for SimpleWebserver"

  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: SimpleWebserver.Endpoint,
        options: [port: 8080]
      )
    ]

    opts = [strategy: :one_for_one, name: SimpleWebserver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
