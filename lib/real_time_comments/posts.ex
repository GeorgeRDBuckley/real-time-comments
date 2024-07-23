defmodule RealTimeComments.Posts do
  alias RealTimeComments.Repo
  alias RealTimeComments.Posts.Post

  def create_post(attrs) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def list_posts() do
    Post
    |> Repo.all()
  end

  def get_post!(id) do
    Repo.get!(Post, id)
  end
end
