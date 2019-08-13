defmodule HnAggregatorWeb.StoryChannelTest do
  use HnAggregatorWeb.ChannelCase

  alias HnAggregator.StoriesServer

  import HnAggregator.Factory

  setup do
    story_1 = build(:story, %{id: 123, title: "Title Sample"})
    story_2 = build(:story, %{id: 456, title: "Title Sample 2"})

    StoriesServer.put(story_1)
    StoriesServer.put(story_2)

    {:ok, reply, _socket} =
      socket(HnAggregatorWeb.UserSocket, "user_id", %{some: :assign})
      |> subscribe_and_join(HnAggregatorWeb.StoryChannel, "stories")

    {:ok, reply: reply}
  end

  test "sends the stories stored on the server on join", %{reply: reply} do
    assert length(reply) == 2
  end
end
