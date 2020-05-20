defmodule PhoenixSidequePoc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhoenixSidequePocWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixSidequePoc.PubSub},
      # Start the Endpoint (http/https)
      PhoenixSidequePocWeb.Endpoint
      # Start a worker by calling: PhoenixSidequePoc.Worker.start_link(arg)
      # {PhoenixSidequePoc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixSidequePoc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixSidequePocWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
