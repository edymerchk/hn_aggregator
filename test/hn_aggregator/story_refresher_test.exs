defmodule HnAggregator.StoryRefresherTest do
  use HnAggregator.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Httpc

  alias HnAggregator.StoryRefresher
  alias HnAggregator.StoriesServer

  describe "refresh/0" do
    setup do
      StoriesServer.reset()
      :ok
    end

    test "stores 50 stories in the StoriesServer" do
      use_cassette "refresh_50_stories" do
        StoryRefresher.refresh()

        result = StoriesServer.get_list()

        assert length(result) == 50
      end
    end
  end
end
