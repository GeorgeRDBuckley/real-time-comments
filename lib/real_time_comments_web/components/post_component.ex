defmodule RealTimeCommentsWeb.PostComponent do
  @moduledoc """
    Post component
  """

  use RealTimeCommentsWeb, :html

  attr :title, :string, required: true
  attr :body, :string, required: true

  def post(assigns) do
    ~H"""
      <article class="flex max-w-xl flex-col items-start justify-between">
        <div class="flex items-center gap-x-4 text-xs">
          <time datetime="2020-03-16" class="text-gray-500">Mar 16, 2020</time>
        </div>
        <div class="group relative">
          <h3 class="mt-3 text-lg font-semibold leading-6 text-gray-900 group-hover:text-gray-600">
            <a href="#">
              <span class="absolute inset-0"></span>
              <%= @title %>
            </a>
          </h3>
          <p class="mt-5 line-clamp-3 text-sm leading-6 text-gray-600 truncate"><%= @body %></p>
        </div>
      </article>
    """
  end
end
