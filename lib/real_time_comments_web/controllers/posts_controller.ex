defmodule RealTimeCommentsWeb.PostsController do
  use RealTimeCommentsWeb, :controller

  alias RealTimeComments.Posts

  def index(conn, _params) do
    posts = Posts.list_posts()

    conn
    |> assign(:posts, posts)
    |> render()
  end
end
