defmodule HnAggregator.HackerNews.StoryFetcher do
  def get_top_stories_ids do
    {:ok, response} = Tesla.get(client(), "/topstories.json")
    process_response(response)
  end

  def get_story(id) do
    {:ok, response} = Tesla.get(client(), "/item/#{id}.json")
    process_response(response)
  end

  defp process_response(response) do
    case response.status do
      200 ->
        {:ok, response.body}

      _ ->
        {:error, response.status}
    end
  end

  defp client do
    [
      {Tesla.Middleware.BaseUrl, "https://hacker-news.firebaseio.com/v0"},
      Tesla.Middleware.JSON
    ]
    |> Tesla.client()
  end
end
