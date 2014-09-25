use Mix.Config

# NOTE: To get SSL working, you will need to set:
#
#     ssl: true,
#     keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#     certfile: System.get_env("SOME_APP_SSL_CERT_PATH"),
#
# Where those two env variables point to a file on disk
# for the key and cert

config :phoenix, CorstestServer.Router,
  port: System.get_env("PORT"),
  ssl: System.get_env("CORS_TEST_SSL_ENABLED"),
  keyfile: System.get_env("CORS_TEST_SSL_KEY"),
  certfile: System.get_env("CORS_TEST_SSL_CERT"),
  host: "corstest-api.coshx.com",
  cookies: true,
  session_key: "_corstest_server_key",
  session_secret: "TL6P*U24+=*S+WW*T67NRZ_K_N*+LV9RU+LV^C=43DH)*EDQ!KC@!76GP%1RFF9!*$)"

config :logger, :console,
  level: :info,
  metadata: [:request_id]

