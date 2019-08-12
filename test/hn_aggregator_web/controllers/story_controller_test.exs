defmodule HnAggregatorWeb.StoryControllerTest do
  use HnAggregatorWeb.ConnCase

  alias HnAggregator.StoriesServer
  alias HnAggregator.Story

  test "#index renders a list of top stories", %{conn: conn} do

    story_1 = %Story{id: 123, title: "Title Sample"}
    story_2 = %Story{id: 456, title: "Title Sample 2"}

    StoriesServer.put(story_1)
    StoriesServer.put(story_2)

    conn = get conn, story_path(conn, :index)

    assert json_response(conn, 200) == %{
      "stories" => [
      %{
        "id" => 456,
        "title" => "Title Sample 2"
      },
      %{
        "id" => 123,
        "title" => "Title Sample"
      }]
    }
  end
end
