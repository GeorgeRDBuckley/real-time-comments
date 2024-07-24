defmodule RealTimeCommentsWeb.Posts.ShowTest do
  use RealTimeCommentsWeb.ConnCase

  import Phoenix.LiveViewTest
  import RealTimeComments.CommentsFixture
  import RealTimeComments.PostsFixtures

  @valid_attrs %{name: "John Doe", body: "This is a comment"}
  @invalid_attrs  %{name: nil, body: nil}

  describe "show" do
    setup [:post, :comments]

    test "lists all comments", %{conn: conn, post: post, comments: comments} do
      {:ok, _view, html} = live(conn, ~p"/posts/#{post.id}")

      for comment <- comments do
        assert html =~ comment.body
      end
    end

    test "create comment with valid attrs", %{conn: conn, post: post} do
      {:ok, view, _html} = live(conn, ~p"/posts/#{post.id}")

      assert view
             |> form("#comment-form", %{comment: @invalid_attrs})
             |> render_change() =~ "can&#39;t be blank"

      {:ok, conn} = view
        |> form("#comment-form", %{comment: @valid_attrs})
        |> render_submit()
        |> follow_redirect(conn, ~p"/posts/#{post.id}")

      assert get_flash(conn, :info) =~ "Comment created"

      html = html_response(conn, 200)
      assert html =~ @valid_attrs[:body]
    end
  end

  defp post(_context) do
     post = post_fixtures()

    %{post: post}
  end

  defp comments(%{post: post}) do
    comment_1 = comment_fixture_with_post(post, %{name: "DesignLover", body: "Awesome post!"})
    comment_2 = comment_fixture_with_post(post, %{name: "WorkFromHomeWarrior", body: "That is amazing!"})

    comments = [
      comment_1,
      comment_2
    ]

    %{comments: comments}
  end
end
