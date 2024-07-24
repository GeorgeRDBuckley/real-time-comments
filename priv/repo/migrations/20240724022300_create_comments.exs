defmodule RealTimeComments.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :name, :string
      add :body, :text
      add :post_id, references(:posts, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:comments, [:post_id])
  end
end
