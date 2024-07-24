defmodule RealTimeCommentsWeb.PostsControllerTest do
  use RealTimeCommentsWeb.ConnCase

  import RealTimeComments.PostsFixtures

  test "GET /", %{conn: conn} do
    post = post_fixtures()

    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Posts"
    assert html_response(conn, 200) =~ post.title
  end
end
