defmodule RealTimeComments.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias RealTimeComments.Posts.Post

  schema "comments" do
    field :name, :string
    field :body, :string
    belongs_to :post, Post

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:name, :body])
    |> validate_required([:name, :body])
  end

  def put_post(%Ecto.Changeset{} = changeset, %Post{} = post) do
    put_assoc(changeset, :post, post)
  end
end
