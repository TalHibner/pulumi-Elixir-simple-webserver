defmodule SimpleWebserver.Endpoint do
  @moduledoc """
  A Plug responsible for logging request info, parsing request body's as JSON,
  matching routes, and dispatching responses.
  """

  use Plug.Router

  plug(Plug.Logger)

  plug(:match)

  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)

  plug(:dispatch)

  get "/" do
    IO.inspect(conn)
    send_resp( conn, 200, inspect_conn_headers(conn) )
  end

  defp inspect_conn_headers(conn) do
    headers = Kernel.inspect( conn.req_headers()  )
    Poison.encode!(%{
      host: conn.host(),
      method: conn.method(),
      query_string: conn.query_string(),
      path_info: conn.path_info(),
      port: conn.port(),
      remote_ip:  Kernel.inspect(conn.remote_ip()),
      headers: headers
      })
  end

  post "/" do
    IO.inspect(conn)
    if String.length(Kernel.inspect(conn.body_params())) == 3 do
      {:ok, body, _conn} = Plug.Conn.read_body(conn)
      send_resp( conn, 200, Poison.encode!(%{headers: inspect_conn_headers(conn),
     body:  body}) )
    else
      send_resp( conn, 200, Poison.encode!(%{headers: inspect_conn_headers(conn),
          body:  conn.body_params()
        }))
    end
  end

  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end
end
