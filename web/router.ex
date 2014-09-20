defmodule CorstestServer.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/tests/websockets"

  get "/tests/simple_cors", CorstestServer.TestController, :simple_cors
  get "/tests/eventsource", CorstestServer.TestController, :eventsource
  channel "test_channel", CorstestServer.TestChannel

end
