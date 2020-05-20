defmodule OutgoingMessageJob do
  require Logger

  def perform(args) do
    :timer.sleep(25)
    args = Map.put(args, "request_completed_at", DateTime.utc_now() |> DateTime.to_unix(:millisecond))
    args = Map.put(args, "time_taken", args["request_completed_at"] - args["received"])
    Logger.warn(inspect args)
  end
end