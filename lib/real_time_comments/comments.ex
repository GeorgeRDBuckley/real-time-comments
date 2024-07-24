defmodule RealTimeComments.Comments do
  import Ecto.Query, warn: false

  alias RealTimeComments.Repo
  alias RealTimeComments.Comments.Comment
  alias RealTimeComments.Posts.Post

  def list_comments do
    Repo.all(Comment)
  end

  def get_comment!(id) do
    Repo.get!(Comment, id)
  end

  def create_comment(%Post{} = post, attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Comment.put_post(post)
    |> Repo.insert()
  end

  def change_comment(%Comment{} = comment, attrs \\ %{}) do
    Comment.changeset(comment, attrs)
  end
end
