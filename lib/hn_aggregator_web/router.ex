defmodule HnAggregatorWeb.Router do
  use HnAggregatorWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HnAggregatorWeb do
    pipe_through :api

    resources "/stories", StoryController, only: [:index, :show]
  end
end
