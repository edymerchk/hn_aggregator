defmodule HnAggregatorWeb.StoryView do
  # use HnAggregatorWeb.Web, :view

  def render("index.json", %{stories: stories}) do
    %{
      stories: Enum.map(stories, &story_json/1)
    }
  end

  defp story_json(story_tuple) do
    {id, story} = story_tuple

    %{
      id: id,
      title: story.title
    }
  end
end
