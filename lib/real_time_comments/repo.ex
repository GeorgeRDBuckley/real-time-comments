defmodule RealTimeComments.Repo do
  use Ecto.Repo,
    otp_app: :real_time_comments,
    adapter: Ecto.Adapters.Postgres
end
