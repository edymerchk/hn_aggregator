defmodule HnAggregator.HackerNews.StoryFetcherTest do
  use HnAggregator.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Httpc

  alias HnAggregator.HackerNews.StoryFetcher

  describe "get_top_stories_ids/0" do
    test "returns an array of the top stories ids in HackerNews" do
      use_cassette "top_stories" do
        {:ok, stories_ids} = StoryFetcher.get_top_stories_ids()

        assert length(stories_ids) == 417
      end
    end
  end

  describe "get_story/1" do
    test "returns an specific story json object from HackerNews using the ID" do
      use_cassette "get_story_20647592" do
        {:ok, story} = StoryFetcher.get_story(20_647_592)

        assert story == %{
                 "by" => "smsm42",
                 "descendants" => 99,
                 "id" => 20_647_592,
                 "kids" => [
                   20_648_560,
                   20_649_487,
                   20_649_343,
                   20_648_451,
                   20_647_875,
                   20_649_468,
                   20_649_386,
                   20_649_164,
                   20_648_401,
                   20_649_438,
                   20_649_366,
                   20_648_010,
                   20_649_210,
                   20_648_131,
                   20_648_527,
                   20_648_153,
                   20_649_027,
                   20_648_659,
                   20_648_957,
                   20_648_244,
                   20_649_458,
                   20_649_192,
                   20_648_129,
                   20_648_461,
                   20_648_083,
                   20_648_245,
                   20_647_724
                 ],
                 "score" => 230,
                 "time" => 1_565_291_597,
                 "title" => "Facebook has been granted patent on shadow banning",
                 "type" => "story",
                 "url" =>
                   "http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO1&Sect2=HITOFF&d=PALL&p=1&u=%2Fnetahtml%2FPTO%2Fsrchnum.htm&r=1&f=G&l=50&s1=10,356,024.PN.&OS=PN/10,356,024&RS=PN/10,356,024"
               }
      end
    end
  end
end
