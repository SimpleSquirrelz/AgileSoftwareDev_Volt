import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :volt, Volt.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "volt_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :volt, VoltWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "9T3J1M4II3cXYMWI9TTwojCgqUS0eY5hqx1NSjxlm84tA9DF9tGtKxETh9UtTV1g",
  server: false

# In test we don't send emails.
config :volt, Volt.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
