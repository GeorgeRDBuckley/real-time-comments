defmodule RealTimeCommentsWeb.PostsLive.Show do
  use RealTimeCommentsWeb, :live_view

  alias RealTimeComments.Comments
  alias RealTimeComments.Comments.Comment
  alias RealTimeComments.Posts

  def mount(%{"id" => id}, _session, socket) do
    post = Posts.get_post!(id)
    comments = post.comments

    form = to_form(Comments.change_comment(%Comment{}))

    socket = socket
    |> assign(:post, post)
    |> assign(:comments, comments)
    |> assign(:form, form)

    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
      <div class="bg-white">
        <div class="mx-auto max-w-7xl px-6 lg:px-8">
          <div class="mx-auto max-w-2xl mb-6">
            <RealTimeCommentsWeb.PostComponent.post id={@post.id} title={@post.title} body={@post.body} datetime={@post.inserted_at} />
          </div>
          <div class="max-w-2xl">
            <div class="flex justify-between items-center mb-6">
              <h2 class="text-lg lg:text-2xl font-bold text-gray-900">Comments</h2>
            </div>
            <.form for={@form} phx-change="validate" phx-submit="save">
              <div class="my-10 space-y-4 bg-white">
                <label for="name" class="sr-only">Your name</label>
                <.input type="text" field={@form[:name]} placeholder={"Joe Bloggs"} />

                <label for="name" class="sr-only">Your comment</label>
                <.input type="textarea" field={@form[:body]} placeholder={"Leave a comment..."} />

                <button type="submit"
                  class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 hover:bg-blue-800">
                  Post comment
                </button>
              </div>
            </.form>
            <div id={"comments"} >
              <RealTimeCommentsWeb.CommentComponent.comment id={comment.id} name={comment.name} body={comment.body} datetime={comment.inserted_at} :for={comment <- @comments} />
            </div>
          </div>
        </div>
      </div>
    """
  end

  def handle_event("validate", %{"comment" => params}, socket) do
    form =
      %Comment{}
      |> Comments.change_comment(params)
      |> to_form(action: :validate)

    {:noreply, assign(socket, form: form)}
  end

  def handle_event("save", %{"comment" => comment_params} = params, socket) do
    case Comments.create_comment(socket.assigns.post, comment_params) do
      {:ok, comment} ->
        RealTimeCommentsWeb.Endpoint.broadcast("comment:#{socket.assigns.post.id}", "CREATED_COMMENT", Map.merge(comment_params, %{inserted_at: Calendar.strftime(comment.inserted_at, "%B %d, %Y - %H:%M:%S"), comment_id: comment.id}))

        {:noreply,
         socket
         |> put_flash(:info, "Comment created")
         |> redirect(to: ~p"/posts/#{socket.assigns.post.id}")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end
end
