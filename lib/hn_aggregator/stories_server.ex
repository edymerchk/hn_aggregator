defmodule HnAggregator.StoriesServer do
  use Agent

  def start_link(_initia_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def put(story) do
    Agent.update(__MODULE__, fn state ->
      state |> Map.put(story.id, story)
    end)
  end

  def get_list do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def reset() do
    Agent.update(__MODULE__, fn _state -> %{} end)
  end
end
