require IEx

defmodule CorstestServer.TestController do
  use Phoenix.Controller

  def simple_cors(conn, _params) do
    conn = Plug.Conn.put_resp_header(conn, "access-control-allow-origin", "*")
    {a, ""} = Integer.parse(conn.params["a"])
    {b, ""} = Integer.parse(conn.params["b"])
    json conn, JSON.encode!(%{sum: a+b})
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
