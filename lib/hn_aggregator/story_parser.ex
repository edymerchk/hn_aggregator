defmodule HnAggregator.StoryParser do
  alias HnAggregator.Story

  def parse(story_raw) do
    %Story{
      id: story_raw["id"],
      by: story_raw["by"],
      descendants: story_raw["descendants"],
      kids: story_raw["kids"],
      score: story_raw["score"],
      time: story_raw["time"],
      title: story_raw["title"],
      url: story_raw["url"]
    }
  end
end
