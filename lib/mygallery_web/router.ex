defmodule MygalleryWeb.Router do
  use MygalleryWeb, :router

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

  scope "/", MygalleryWeb do
    # Use the default browser stack
    pipe_through :browser

    get "/", PageController, :index
    get "/artist/new", ArtistController, :new
    post "/artist", ArtistController, :create
    get "/artists", ArtistController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", MygalleryWeb do
  #   pipe_through :api
  # end
end
