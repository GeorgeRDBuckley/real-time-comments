defmodule RealTimeComments.Posts do
  import Ecto.Query, warn: false

  alias RealTimeComments.Repo
  alias RealTimeComments.Posts.Post

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
