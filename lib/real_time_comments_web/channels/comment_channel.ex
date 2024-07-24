defmodule RealTimeCommentsWeb.CommentChannel do
  use RealTimeCommentsWeb, :channel

  @impl true
  def join("comment:"  <> _comment_id, payload, socket) do
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  @impl true
  def handle_in("CREATED_COMMENT", payload, socket) do
    broadcast(socket, "CREATED_COMMENT", payload)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
