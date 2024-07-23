defmodule RealTimeCommentsWeb.PostComponent do
  @moduledoc """
    Post component
  """

  use RealTimeCommentsWeb, :html

  attr :title, :string, required: true
  attr :body, :string, required: true
  attr :datetime, :string, required: true

  def post(assigns) do
    ~H"""
      <article class="flex max-w-xl flex-col items-start justify-between">
        <div class="flex items-center gap-x-4 text-xs">
          <%= date_time_element(assigns) %>
        </div>
        <div class="group relative">
          <h3 class="mt-3 text-lg font-semibold leading-6 text-gray-900 group-hover:text-gray-600">
            <a href={~p"/posts/#{@id}"}>
              <span class="absolute inset-0"></span>
              <%= @title %>
            </a>
          </h3>
          <p class="mt-5 line-clamp-3 text-sm leading-6 text-gray-600 truncate"><%= @body %></p>
        </div>
      </article>
    """
  end

  defp date_time_element(assigns) do
    assigns = assign(assigns, :formatted_datetime, Calendar.strftime(assigns[:datetime], "%B %d, %Y, %H:%M:%S"))

    ~H"""
      <time datetime={@formatted_datetime} class="text-gray-500"><%= @formatted_datetime %></time>
    """
  end
end
