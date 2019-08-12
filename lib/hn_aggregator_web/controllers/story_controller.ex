defmodule HnAggregatorWeb.StoryController do
  use HnAggregatorWeb, :controller

  alias HnAggregator.StoriesServer

  def index(conn, _params) do
    render(conn, "index.json", stories: StoriesServer.get_list())
  end

  # TODO: handle 404
  def show(conn, %{"id" => id}) do
    story = String.to_integer(id) |> StoriesServer.get_story()
    render(conn, "show.json", story: {id, story})
  end
end
