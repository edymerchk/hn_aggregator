defmodule HnAggregatorWeb.StoryView do
  alias HnAggregator.Story

  def render("index.json", %{stories: stories}) do
    %{
      stories: Enum.map(stories, &story_json/1)
    }
  end

  def render("show.json", %{story: story}) do
    %{story: story_json(story)}
  end

  def story_json(%Story{} = story) do
    %{
      id: story.id,
      title: story.title
    }
  end
end
