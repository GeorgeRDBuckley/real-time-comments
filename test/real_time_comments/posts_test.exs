defmodule RealTimeComments.PostsTest do
  use RealTimeComments.DataCase

  import RealTimeComments.PostsFixtures

  alias RealTimeComments.Posts

  describe "create_post/1" do
    @valid_attrs %{title: "Test post", body: "This is a post"}
    @invalid_attrs %{title: nil, body: nil}

    test "inserts with valid attrs" do
      assert {:ok, post} = Posts.create_post(@valid_attrs)
      assert post.id
      assert post.title == @valid_attrs[:title]
      assert post.body == @valid_attrs[:body]
    end

    test "returns changeset with invalid attrs" do
      assert {:error, %Ecto.Changeset{}} = Posts.create_post(@invalid_attrs)
    end
  end

  describe "list_posts/0" do
    test "lists all posts" do
      post_1 = post_fixtures(title: "Test title", body: "Test body")
      post_2 = post_fixtures(title: "Test title 2", body: "Test body 2")

      assert Posts.list_posts() == [post_1, post_2]
    end
  end

  describe "get_post!/1" do
    test "returns the post with given id" do
      post = post_fixtures()
      assert Posts.get_post!(post.id) == post
    end
  end
end
