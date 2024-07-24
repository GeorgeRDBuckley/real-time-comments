defmodule RealTimeComments.CommentsTest do
  use RealTimeComments.DataCase

  import RealTimeComments.CommentsFixture
  import RealTimeComments.PostsFixtures
  alias RealTimeComments.Comments

  describe "create_comment/2" do
    @valid_attrs %{name: "Test name", body: "Test body"}
    @invalid_attrs  %{name: nil, body: nil}

    test "inserts with valid attrs" do
      post = post_fixtures()

      assert {:ok, comment} = Comments.create_comment(post, @valid_attrs)
      assert comment.id
      assert comment.name == @valid_attrs[:name]
      assert comment.body == @valid_attrs[:body]
    end

    test "returns changeset with invalid attrs" do
      post = post_fixtures()

      assert {:error, %Ecto.Changeset{}} = Comments.create_comment(post, @invalid_attrs)
    end
  end

  describe "list_comments/0" do
    test "lists all comments" do
      comment_1 = comment_fixture()
      comment_2 = comment_fixture()

      assert Comments.list_comments() == [comment_1, comment_2]
    end
  end

  describe "get_comment!/1" do
    test "returns the comment with given id" do
      comment = comment_fixture()
      assert Comments.get_comment!(comment.id) == comment
    end
  end
end
