defmodule ShopWeb.Router do
  use ShopWeb, :router

  import ShopWeb.UserAuth
  alias ShopWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ShopWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_scope_for_user
    plug Plugs.SetConsole, "pc"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # pipeline :auth do
  #  plug Plugs.EnsureAuthenticated
  # end

  ## Authentication routes

  scope "/", ShopWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{ShopWeb.UserAuth, :require_authenticated}] do
      live "/users/settings", UserLive.Settings, :edit
      live "/users/settings/confirm-email/:token", UserLive.Settings, :confirm_email
    end

    post "/users/update-password", UserSessionController, :update_password
    # Created with mix tasks and now is an obligation to be authenticated
    resources "/promotions", PromotionController
  end

  scope "/", ShopWeb do
    pipe_through [:browser]

    live_session :current_user,
      on_mount: [{ShopWeb.UserAuth, :mount_current_scope}] do
      live "/users/register", UserLive.Registration, :new
      live "/users/log-in", UserLive.Login, :new
      live "/users/log-in/:token", UserLive.Confirmation, :new
    end

    post "/users/log-in", UserSessionController, :create
    delete "/users/log-out", UserSessionController, :delete
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
    live "/products-live", ProductLive.Index
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
