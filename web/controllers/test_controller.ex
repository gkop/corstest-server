defmodule CorstestServer.TestController do
  use Phoenix.Controller

  def simple_cors(conn, _params) do
    conn = Plug.Conn.put_resp_header(conn, "access-control-allow-origin", "*")
    {a, ""} = Integer.parse(conn.params["a"])
    {b, ""} = Integer.parse(conn.params["b"])
    json conn, JSON.encode!(%{sum: a+b})
  end

  def preflight_cors_options(conn, _params) do
    conn = Plug.Conn.put_resp_header(conn, "access-control-allow-origin", "*")
    conn = Plug.Conn.put_resp_header(conn, "access-control-allow-headers", "x-a, x-b")
    Plug.Conn.send_resp(conn, 200, "")
  end

  def preflight_cors(conn, _params) do
    conn = Plug.Conn.put_resp_header(conn, "access-control-allow-origin", "*")
    {a, ""} = Integer.parse(hd(Plug.Conn.get_req_header(conn, "x-a")))
    {b, ""} = Integer.parse(hd(Plug.Conn.get_req_header(conn, "x-b")))
    json conn, JSON.encode!(%{sum: a+b})
  end

  def eventsource(conn, _params) do
    conn = Plug.Conn.put_resp_header(conn, "access-control-allow-origin", "*")
    conn = Plug.Conn.put_resp_content_type(conn, "text/event-stream")

    conn = Plug.Conn.send_chunked(conn, 200)

    {a, ""} = Integer.parse(conn.params["a"])
    {b, ""} = Integer.parse(conn.params["b"])

    data = "event: a\ndata: #{a}\n\n"
    Plug.Conn.chunk(conn, data)

    data = "event: b\ndata: #{b}\n\n"
    Plug.Conn.chunk(conn, data)

    data = "event: sum\ndata: #{a+b}\n\n"
    Plug.Conn.chunk(conn, data)

    conn
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
