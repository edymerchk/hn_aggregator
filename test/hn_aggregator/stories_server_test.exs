defmodule HnAggregator.StoriesServerTest do
  use HnAggregator.Case, async: true

  alias HnAggregator.StoriesServer
  alias HnAggregator.Story

  setup do
    StoriesServer.reset()
    on_exit(fn -> StoriesServer.reset() end)

    story = %Story{id: 123, title: "Title Sample"}

    {:ok, story: story}
  end

  describe "put/1" do
    test "can store a story", %{story: story} do
      StoriesServer.put(story)

      assert StoriesServer.get_list() == %{story.id => story}
    end
  end

  describe "reset/0" do
    test "clears the Agent", %{story: story} do
      StoriesServer.put(story)

      StoriesServer.reset()

      assert StoriesServer.get_story(story.id) == nil
    end
  end
end
