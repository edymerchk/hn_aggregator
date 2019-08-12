defmodule HnAggregator.StoryRefresherSchedulerTest do
  use HnAggregator.Case, async: true

  alias HnAggregator.StoryRefresherScheduler

  import Mock

  describe "refresh/0" do
    setup_with_mocks([
      {HnAggregator.StoryRefresher, [], [refresh: fn -> nil end]}
    ]) do
      start_supervised!({StoryRefresherScheduler, []})
      :ok
    end

    test "responds to the :refresh_stories message by calling the StoryRefresher" do
      StoryRefresherScheduler.handle_info(:refresh_stories, %{})

      assert_called(HnAggregator.StoryRefresher.refresh())
    end
  end
end
