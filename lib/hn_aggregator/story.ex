defmodule HnAggregator.Story do
  @enforce_keys [:id, :title]

  defstruct [
    :id,
    :by,
    :descendants,
    :kids,
    :score,
    :time,
    :title,
    :url
  ]
end
