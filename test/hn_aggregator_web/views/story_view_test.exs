defmodule HnAggregatorWeb.StoryViewTest do
  use HnAggregatorWeb.ConnCase, async: true

  import HnAggregator.Factory

  alias HnAggregatorWeb.StoryView

  test "index.json" do
    story = build(:story)

    rendered_stories = StoryView.render("index.json", %{stories: [story]})

    assert rendered_stories == %{
             stories: [StoryView.story_json(story)]
           }
  end

  test "show.json" do
    story = build(:story)

    rendered_story = StoryView.render("show.json", %{story: story})

    assert rendered_story == %{
             story: StoryView.story_json(story)
           }
  end

  test "story_json" do
    story = build(:story)

    rendered_story = StoryView.story_json(story)

    assert rendered_story == %{
             id: story.id,
             by: story.by,
             descendants: story.descendants,
             kids: story.kids,
             score: story.score,
             time: story.time,
             title: story.title,
             url: story.url
           }
  end
end
