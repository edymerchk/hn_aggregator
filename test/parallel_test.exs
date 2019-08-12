defmodule ParallelTest do
  use ExUnit.Case, async: true

  describe "pmap/2" do
    test "applies the given function to the enumerable" do
      assert(Parallel.pmap(1..100, &(&1 * &1)) == Enum.map(1..100, &(&1 * &1)))
    end
  end
end
