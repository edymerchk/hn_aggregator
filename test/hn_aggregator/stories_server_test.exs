defmodule HnAggregator.StoriesServerTest do
  use HnAggregator.Case, async: true

  alias HnAggregator.StoriesServer

  import HnAggregator.Factory

  setup do
    StoriesServer.reset()
    on_exit(fn -> StoriesServer.reset() end)

    story = build(:story)

    {:ok, story: story}
  end

  describe "put/1" do
    test "can store a story", %{story: story} do
      StoriesServer.put(story)

      assert StoriesServer.get_list() == [story]
    end
  end

  describe "get_list/0" do
    test "returns the list of stories stored", %{story: story} do
      story_2 = build(:story, %{id: 456})

      StoriesServer.put(story)
      StoriesServer.put(story_2)

      result = StoriesServer.get_list()

      assert length(result) == 2
    end
  end

  describe "get_story/1" do
    test "returns the story with an specific id", %{story: story} do
      StoriesServer.put(story)

      assert StoriesServer.get_story(story.id) == story
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
