defmodule Alerting.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AlertingWeb.Telemetry,
      Alerting.Repo,
      {DNSCluster, query: Application.get_env(:alerting, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Alerting.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Alerting.Finch},
      # Start a worker by calling: Alerting.Worker.start_link(arg)
      # {Alerting.Worker, arg},
      # Start to serve requests, typically the last entry
      AlertingWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Alerting.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AlertingWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
