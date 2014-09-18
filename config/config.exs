# This file is responsible for configuring your application
use Mix.Config

# Note this file is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project.

config :phoenix, CorstestServer.Router,
  port: System.get_env("PORT"),
  ssl: false,
  static_assets: true,
  cookies: true,
  session_key: "_corstest_server_key",
  session_secret: "TL6P*U24+=*S+WW*T67NRZ_K_N*+LV9RU+LV^C=43DH)*EDQ!KC@!76GP%1RFF9!*$)",
  catch_errors: true,
  debug_errors: false,
  error_controller: CorstestServer.PageController

config :phoenix, :code_reloader,
  enabled: false

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. Note, this must remain at the bottom of
# this file to properly merge your previous config entries.
import_config "#{Mix.env}.exs"
