defmodule PhoenixTestInputsFor.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_test_inputs_for,
    adapter: Ecto.Adapters.Postgres
end
