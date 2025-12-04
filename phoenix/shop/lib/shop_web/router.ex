defmodule ShopWeb.Router do
  use ShopWeb, :router
  alias ShopWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShopWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plugs.SetConsole, "pc"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # pipeline :auth do
  #  plug Plugs.EnsureAuthenticated
  # end

  scope "/", ShopWeb do
    pipe_through :browser

    get "/", PageController, :home
    # get "/products", ProductController, :index
    get "/products/no-layout", ProductController, :index_no_layout
    # get "/products/:id", ProductController, :show
    # Added resources macro for products only is for assign that you want, and except is for what you don't want
    resources "/products", ProductController, only: [:index]
    get "/products/:slug", ProductController, :show

    # Nested resources example for users and their posts and you can add opts as well
    # resources "/users", UserController, only: [:index, :show] do
    #  resources "/posts", PostController
    # end
    # Created with mix tasks
    resources "/promotions", PromotionController
  end

  # Add a diferent scope
  # scope "/dashboard", ShopWeb do
  #  pipe_through [:browser, :auth]
  #
  #  get "/", DashboardController, :index
  # end

  # Other scopes may use custom stacks.
  # scope "/api", ShopWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:shop, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ShopWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
