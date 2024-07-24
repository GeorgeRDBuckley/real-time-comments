defmodule RealTimeCommentsWeb.CommentComponent do
  @moduledoc """
    Comment component
  """

  use RealTimeCommentsWeb, :html

  def comment(assigns) do
    ~H"""
    <div class="p-6 text-base bg-white rounded-lg border">
      <div class="flex justify-between items-center mb-2">
        <div class="flex items-center">
          <p class="inline-flex items-center mr-3 text-sm text-gray-900  font-semibold">George</p>
          <p class="text-sm text-gray-600 dark:text-gray-400">24 July, 2024 - 6:00am</p>
        </div>
      </div>
      <p class="text-gray-500 dark:text-gray-400">
        Test comment
      </p>
    </div>
    """
  end
end
