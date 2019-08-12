defmodule HnAggregatorWeb.StoryController do
  use HnAggregatorWeb, :controller

  alias HnAggregator.Story

  def index(conn, _params) do
    stories = [%Story{id: 123, title: "Title Sample"}]
    render conn, "index.json", stories: stories
  end
end
