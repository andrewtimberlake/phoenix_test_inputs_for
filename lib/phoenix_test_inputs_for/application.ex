defmodule PhoenixTestInputsFor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixTestInputsForWeb.Telemetry,
      PhoenixTestInputsFor.Repo,
      {DNSCluster, query: Application.get_env(:phoenix_test_inputs_for, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixTestInputsFor.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixTestInputsFor.Finch},
      # Start a worker by calling: PhoenixTestInputsFor.Worker.start_link(arg)
      # {PhoenixTestInputsFor.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixTestInputsForWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixTestInputsFor.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixTestInputsForWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
