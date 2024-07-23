defmodule RealTimeComments.PostsFixtures do
  def post_fixtures(attrs \\ %{}) do
    {:ok, post} = attrs
    |> Enum.into(%{
      title: "test title",
      body: "test body"
    })
    |> RealTimeComments.Posts.create_post()

    post
  end
end
