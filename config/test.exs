use Mix.Config

config :phoenix, CorstestServer.Router,
  port: System.get_env("PORT") || 4001,
  ssl: false,
  cookies: true,
  session_key: "_corstest_server_key",
  session_secret: "TL6P*U24+=*S+WW*T67NRZ_K_N*+LV9RU+LV^C=43DH)*EDQ!KC@!76GP%1RFF9!*$)"

config :phoenix, :code_reloader,
  enabled: true

config :logger, :console,
  level: :debug


