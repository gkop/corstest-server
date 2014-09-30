defmodule CorstestServer.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/tests/websockets"

  post "/tests/preflight_cors", CorstestServer.TestController,
    :preflight_cors
  options "/tests/preflight_cors", CorstestServer.TestController,
    :preflight_cors_options

  get "/tests/simple_cors", CorstestServer.TestController, :simple_cors

  get "/tests/eventsource", CorstestServer.TestController, :eventsource

  channel "test_channel", CorstestServer.TestChannel

end
