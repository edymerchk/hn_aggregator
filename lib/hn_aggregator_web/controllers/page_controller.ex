defmodule HnAggregatorWeb.PageController do
  use HnAggregatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
