defmodule CorstestServer.Router do
  use Phoenix.Router

  get "/tests/simple_cors", CorstestServer.TestController, :simple_cors

end
