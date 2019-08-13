defmodule HnAggregator.StoriesServer do
  use Agent

  @default_pagination_size 10

  def start_link(_initia_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def put(story) do
    Agent.update(__MODULE__, fn state ->
      state |> Map.put(story.id, story)
    end)
  end

  def get_list do
    Agent.get(__MODULE__, fn state ->
      Enum.map(state, fn {_id, story} -> story end)
    end)
  end

  def get_paginated_list(page \\ 1) do
    get_list()
    |> Enum.slice(offset(page), @default_pagination_size)
  end

  def get_story(id) do
    Agent.get(__MODULE__, fn state -> state |> Map.get(id) end)
  end

  def reset() do
    Agent.update(__MODULE__, fn _state -> %{} end)
  end

  defp offset(page) do
    if page - 1 < 0 do
      0
    else
      @default_pagination_size * (page - 1)
    end
  end
end
