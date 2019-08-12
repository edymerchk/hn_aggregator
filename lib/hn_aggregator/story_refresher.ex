defmodule HnAggregator.StoryRefresher do
  alias HnAggregator.HackerNews.StoryFetcher
  alias HnAggregator.StoriesServer
  alias HnAggregator.StoryParser

  @max_stories 50

  def refresh do
    stories_ids() |> Parallel.pmap(fn story_id -> save_story(story_id) end)
  end

  defp save_story(story_id) do
    {:ok, story_raw} = StoryFetcher.get_story(story_id)

    story_raw
    |> StoryParser.parse()
    |> StoriesServer.put()
  end

  defp stories_ids do
    {:ok, stories_ids} = StoryFetcher.get_top_stories_ids()

    stories_ids
    |> Enum.take(@max_stories)
  end
end
