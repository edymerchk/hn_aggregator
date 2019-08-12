defmodule HnAggregator.StoriesServerTest do
  use HnAggregator.Case, async: true

  alias HnAggregator.StoriesServer

  setup do
    StoriesServer.reset()
    on_exit(fn -> StoriesServer.reset() end)

    :ok
  end

  test "can store and retrieve a list of things" do
    StoriesServer.put("a")
    StoriesServer.put("b")

    assert(StoriesServer.get_list() == ["b", "a"])
  end

  test "is cleared out by reset/0" do
    StoriesServer.put("a")
    StoriesServer.reset()

    assert(StoriesServer.get_list() == [])
  end
end
