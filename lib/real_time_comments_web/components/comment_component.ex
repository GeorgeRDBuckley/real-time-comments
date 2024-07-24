defmodule RealTimeCommentsWeb.CommentComponent do
  @moduledoc """
    Comment component
  """

  use RealTimeCommentsWeb, :html

  attr :name, :string, required: true
  attr :datetime, :string, required: true
  attr :body, :string, required: true

  def comment(assigns) do
    ~H"""
    <div class="p-6 text-base bg-white rounded-lg border mb-2">
      <div class="flex justify-between items-center mb-2">
        <div class="flex items-center">
          <p class="inline-flex items-center mr-3 text-sm text-gray-900  font-semibold"><%= @name %></p>
          <p class="text-sm text-gray-600 dark:text-gray-400"><%= date_time_element(assigns) %></p>
        </div>
      </div>
      <p class="text-gray-500 dark:text-gray-400">
        <%= @body %>
      </p>
    </div>
    """
  end

  defp date_time_element(assigns) do
    assigns = assign(assigns, :formatted_datetime, Calendar.strftime(assigns[:datetime], "%B %d, %Y - %H:%M:%S"))

    ~H"""
      <time datetime={@formatted_datetime} class="text-gray-500"><%= @formatted_datetime %></time>
    """
  end
end
