defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ApiWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # Other scopes may use custom stacks.
  scope "/api", ApiWeb do
    pipe_through(:api)
    resources("/items", ItemController, except: [:new, :edit])
    resources("/list_items", ListItemController, except: [:new, :edit])
    resources("/lists", ListController, except: [:new, :edit])
    resources("/persons", PersonController, except: [:new, :edit])
  end
end
