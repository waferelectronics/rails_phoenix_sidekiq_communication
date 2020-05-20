defmodule PhoenixSidequePocWeb.MessageView do
  use PhoenixSidequePocWeb, :view
  alias PhoenixSidequePocWeb.MessageView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessageView, "message.json")}
  end
end
