defmodule RealTimeComments.CommentsFixture do
  alias RealTimeComments.Comments.Comment
  alias RealTimeComments.Repo
  @doc """
  Generate a comment.
  """

  def comment_fixture_with_post(post, attrs \\ %{}) do
    attrs = attrs
    |> Enum.into(%{
      body: "some body",
      name: "some name"
    })

    {:ok, comment} = RealTimeComments.Comments.create_comment(post, attrs)

    comment
  end

  def comment_fixture(attrs \\ %{}) do
    attrs = attrs
    |> Enum.into(%{
      body: "some body",
      name: "some name"
    })

    {:ok, comment} = %Comment{}
      |> Comment.changeset(attrs)
      |> Repo.insert()

    comment
  end
end
