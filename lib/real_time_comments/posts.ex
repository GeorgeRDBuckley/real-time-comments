defmodule RealTimeComments.Posts do
  alias RealTimeComments.Repo
  alias RealTimeComments.Posts.Post

  import Ecto.Query, warn: false

  def create_post(attrs) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def list_posts() do
    Post
    |> order_by(desc: :inserted_at)
    |> Repo.all()
  end

  def get_post!(id) do
    Repo.get!(Post, id)
  end
end
