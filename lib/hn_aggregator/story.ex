defmodule HnAggregator.Story do
  # TODO: review
  @enforce_keys [:id, :title]

  defstruct [
    :id, :by, :descendants, :kids, :score, :time, :title, :url
  ]
  # TODO: @type spec
end
