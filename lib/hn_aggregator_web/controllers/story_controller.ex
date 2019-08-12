defmodule HnAggregatorWeb.StoryController do
  use HnAggregatorWeb, :controller

  alias HnAggregator.Story
  alias HnAggregator.StoriesServer

  def index(conn, _params) do
    render conn, "index.json", stories: StoriesServer.get_list()
  end
end
