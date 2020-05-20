defmodule PhoenixSidequePocWeb.MessageController do
  use PhoenixSidequePocWeb, :controller

  action_fallback PhoenixSidequePocWeb.FallbackController

  def index(conn, _params) do
    messages = []
    Exq.enqueue(Exq, "incoming_message", "IncomingMessageJob" , [
      %{
      :uuid => UUID.uuid4, 
      :received => DateTime.utc_now() |> DateTime.to_unix(:millisecond)
      }
    ])
    :timer.sleep(20)
    render(conn, "index.json", messages: messages)
  end
end
