defmodule RealTimeCommentsWeb.PostsController do
  use RealTimeCommentsWeb, :controller

  alias RealTimeComments.Posts

  def index(conn, _params) do
    posts = Posts.list_posts()

    conn
    |> assign(:posts, posts)
    |> render()
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id)
    comments = post.comments

    conn
    |> assign(:post, post)
    |> assign(:comments, comments)
    |> render()
  end
end
