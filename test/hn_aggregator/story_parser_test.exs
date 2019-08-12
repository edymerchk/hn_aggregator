defmodule HnAggregator.StoryParserTest do
  use HnAggregator.Case, async: true

  alias HnAggregator.StoryParser
  alias HnAggregator.Story

  describe "parse/1" do
    test "parses a story raw map into a Story struct" do
      story_raw = %{
        "by" => "JabavuAdams",
        "descendants" => 39,
        "id" => 20_657_398,
        "kids" => [
          20_657_753,
          20_658_201,
          20_658_326,
          20_658_086,
          20_657_865,
          20_657_797,
          20_657_998,
          20_657_666,
          20_658_161,
          20_658_114,
          20_658_368,
          20_657_740,
          20_657_738
        ],
        "score" => 141,
        "time" => 1_565_377_773,
        "title" => "Home Chip Fab",
        "type" => "story",
        "url" => "http://sam.zeloof.xyz/category/semiconductor/"
      }

      assert StoryParser.parse(story_raw) == %Story{
               by: "JabavuAdams",
               descendants: 39,
               id: 20_657_398,
               kids: [
                 20_657_753,
                 20_658_201,
                 20_658_326,
                 20_658_086,
                 20_657_865,
                 20_657_797,
                 20_657_998,
                 20_657_666,
                 20_658_161,
                 20_658_114,
                 20_658_368,
                 20_657_740,
                 20_657_738
               ],
               score: 141,
               time: 1_565_377_773,
               title: "Home Chip Fab",
               url: "http://sam.zeloof.xyz/category/semiconductor/"
             }
    end
  end
end
