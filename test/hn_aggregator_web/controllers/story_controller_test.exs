defmodule HnAggregatorWeb.StoryControllerTest do
  use HnAggregatorWeb.ConnCase

  alias HnAggregator.StoriesServer

  import HnAggregator.Factory

  describe "#index" do
    test "renders a list of top stories", %{conn: conn} do
      story_1 = build(:story, %{id: 123, title: "Title Sample"})
      story_2 = build(:story, %{id: 456, title: "Title Sample 2"})

      StoriesServer.put(story_1)
      StoriesServer.put(story_2)

      conn = get(conn, "/api/stories?page=1")

      result = json_response(conn, 200)["stories"]

      assert length(result) == 2
    end
  end

  describe "#show" do
    test "renders a single story", %{conn: conn} do
      story_1 = build(:story, %{id: 123, title: "Title Sample"})

      StoriesServer.put(story_1)

      conn = get(conn, story_path(conn, :show, story_1.id))

      assert json_response(conn, 200) == %{
               "story" => %{
                 "by" => "edymerchk",
                 "descendants" => 10,
                 "id" => 123,
                 "kids" => [456, 789],
                 "score" => 141,
                 "time" => 1_565_377_773,
                 "title" => "Title Sample",
                 "url" => "http://www.google.com/"
               }
             }
    end
  end
end
