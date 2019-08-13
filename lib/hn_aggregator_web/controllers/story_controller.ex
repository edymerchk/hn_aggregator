defmodule HnAggregatorWeb.StoryController do
  use HnAggregatorWeb, :controller

  alias HnAggregator.StoriesServer

  def index(conn, %{"page" => page}) do
    render(conn, "index.json", stories: StoriesServer.get_paginated_list(String.to_integer(page)))
  end

  def show(conn, %{"id" => id}) do
    story = String.to_integer(id) |> StoriesServer.get_story()
    render(conn, "show.json", story: story)
  end
end
