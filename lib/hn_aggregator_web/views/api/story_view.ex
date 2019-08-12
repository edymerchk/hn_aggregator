defmodule HnAggregatorWeb.StoryView do
  # use HnAggregatorWeb.Web, :view

  def render("index.json", %{stories: stories}) do
    %{
      stories: Enum.map(stories, &story_json/1)
    }
  end

  def render("show.json", %{story: story}) do
    %{story: story_json(story)}
  end

  # TODO: fix story_tuple
  defp story_json(story_tuple) do
    {_id, story} = story_tuple

    %{
      id: story.id,
      title: story.title
    }
  end
end
