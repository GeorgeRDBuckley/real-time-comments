defmodule RealTimeCommentsWeb.CommentChannelTest do
  use RealTimeCommentsWeb.ChannelCase

  import RealTimeComments.PostsFixtures

  setup do
    post = post_fixtures()

    {:ok, _, socket} =
      RealTimeCommentsWeb.UserSocket
      |> socket("user_id", %{some: :assign})
      |> subscribe_and_join(RealTimeCommentsWeb.CommentChannel, "comment:#{post.id}")

    %{socket: socket}
  end

  test "ping replies with status ok", %{socket: socket} do
    ref = push(socket, "ping", %{"hello" => "there"})
    assert_reply ref, :ok, %{"hello" => "there"}
  end
end
