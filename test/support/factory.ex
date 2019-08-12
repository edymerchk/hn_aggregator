defmodule HnAggregator.Factory do
  use ExMachina

  def story_factory do
    %HnAggregator.Story{
      by: "edymerchk",
      descendants: 10,
      id: 123,
      kids: [
        456,
        789
      ],
      score: 141,
      time: 1_565_377_773,
      title: sequence(:title, &"Sample Title #{&1}"),
      url: "http://www.google.com/"
    }
  end
end
