defmodule Pragmatic.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Pragmatic.Repo,
      PragmaticWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:pragmatic, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Pragmatic.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Pragmatic.Finch},
      # Start a worker by calling: Pragmatic.Worker.start_link(arg)
      # {Pragmatic.Worker, arg},
      # Start to serve requests, typically the last entry
      PragmaticWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pragmatic.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PragmaticWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
