use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, ApiWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :api, Api.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("TREELIO_DB_USERNAME"),
  password: System.get_env("TREELIO_DB_PASSWORD"),
  database: "treelio_api_dev",
  database: "treelio_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
