defmodule HnAggregatorWeb.StoryView do
  # use HnAggregatorWeb.Web, :view

  def render("index.json", %{stories: stories}) do
    %{
      stories: Enum.map(stories, &story_json/1)
    }
  end

  def story_json(story) do
    %{
      id: story.id,
      title: story.title
    }
  end
end
