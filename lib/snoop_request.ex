defmodule SnoopRequest do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(200, "<html><header><title>Request Snoop</title></header>"
    <> "<body><table>"
    <> "<tr><td><b>Path Info</b><hr/>" <> Kernel.inspect(conn.path_info) <> "</td></tr>"
    <> "<tr><td><b>Request Headers</b><hr/>"
    <> "<table><tr><td><b>Name</b></td><td><b>Value</b></td></tr>"
    <> headers(conn.req_headers)
    <> "<tr><td><b>query_string</b><hr/>" <> Kernel.inspect(conn.query_string) <> "</td></tr>"
    <> "<tr><td><b>Body</b><hr/>"
    <> body(conn)
    <> "</table></td></tr></table></body><html>")
  end

  defp headers(headers) do
    Enum.reduce(headers, "", fn {key, value}, acc ->
      acc <> "<tr><td>" <> key <> "</td><td>" <> value <> "</td></tr>"
    end)
  end

  def body(conn) do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    body
  end

end
