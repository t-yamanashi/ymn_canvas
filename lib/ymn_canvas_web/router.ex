defmodule YmnCanvasWeb.Router do
  use YmnCanvasWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {YmnCanvasWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", YmnCanvasWeb do
    pipe_through :browser

    live "/", CanvasLive.Index, :index
    live "/sample01", CanvasLive.Sample01, :index
    live "/sample02", CanvasLive.Sample02, :index
    live "/sample03", CanvasLive.Sample03, :index
    live "/sample04", CanvasLive.Sample04, :index
    live "/sample05", CanvasLive.Sample05, :index
    live "/sample06", CanvasLive.Sample06, :index
    live "/sample07", CanvasLive.Sample07, :index
    live "/sample08", CanvasLive.Sample08, :index
    live "/sample09", CanvasLive.Sample09, :index

  end

  # Other scopes may use custom stacks.
  # scope "/api", YmnCanvasWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: YmnCanvasWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
