defmodule HnAggregatorWeb.StoryChannel do
  use HnAggregatorWeb, :channel

  alias HnAggregator.StoriesServer

  def join("stories", payload, socket) do
    {:ok, StoriesServer.get_list(), socket}
  end
end
