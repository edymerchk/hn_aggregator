defmodule HnAggregator.StoryRefresherScheduler do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, opts)
  end

  def init(state) do
    send(self(), :refresh_stories)
    {:ok, state}
  end

  def handle_info(:refresh_stories, state) do
    HnAggregator.StoryRefresher.refresh()
    delayed_refresh()

    {:noreply, state}
  end

  defp delayed_refresh() do
    Process.send_after(self(), :refresh_stories, refresh_period())
  end

  defp refresh_period do
    String.to_integer(System.get_env("STORIES_REFRESH_PERIOD") || "300000")
  end
end
