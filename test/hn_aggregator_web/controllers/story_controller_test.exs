defmodule HnAggregatorWeb.StoryControllerTest do
  use HnAggregatorWeb.ConnCase

  test "#index renders a list of top stories", %{conn: conn} do
    conn = get conn, story_path(conn, :index)

    assert json_response(conn, 200) == %{
      "stories" => [%{
        "id" => 123,
        "title" => "Title Sample"
      }]
    }
  end
end
