defmodule CorstestServer.TestChannel do
  use Phoenix.Channel

  def join(socket, "stewiecutedog", message) do
    {:ok, socket}
  end

  def join(socket, _no, _message) do
    {:error, socket, :unauthorized}
  end

  def event(socket, "stewiecutedog:sum", message) do
    reply socket, "return_sum", %{sum: message["a"]+message["b"]}
    socket
  end

end
